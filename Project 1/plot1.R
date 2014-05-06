require(dplyr)

input_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

#convert date to standard date format
input_data$Date <- as.Date(input_data$Date, "%d/%m/%Y")

# get rid of data outside od our range 2007-02-01 and 2007-02-02
input_data <- filter(input_data, Date == "2007-02-01" | Date == "2007-02-02")

png(
  "plot1.png",
  width     = 480,
  height    = 480,
  units     = "px",
)

#generate the graph
hist(input_data$Global_active_power, col = "red",
     main="Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()
