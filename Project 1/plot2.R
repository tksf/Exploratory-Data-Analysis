require(dplyr)

input_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

#convert date to standard date format
input_data$Date <- as.Date(input_data$Date, "%d/%m/%Y")

# get rid of data outside od our range 2007-02-01 and 2007-02-02
input_data <- filter(input_data, Date == "2007-02-01" | Date == "2007-02-02")

# create right time format
input_data$tmp_time <- paste(input_data$Date, input_data$Time)
input_data$timestamp <- strptime(input_data$tmp_time, "%Y-%m-%d %H:%M:%S")

png(
  "plot2.png",
  width     = 480,
  height    = 480,
  units     = "px",
)

#generate the graph
plot(input_data$timestamp, input_data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
     )


dev.off()
