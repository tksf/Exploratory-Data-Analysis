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
  "plot4.png",
  width     = 480,
  height    = 480,
  units     = "px",
)

# set parameters for multi graph layout
par(mfcol = c(2,2), mar = c(4,4,2,1))


#generate the graphs

#1
plot(input_data$timestamp, input_data$Global_active_power,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = ""
)

#2
plot(input_data$timestamp, input_data$Sub_metering_1,
     type = "l",
     col = "black",
     ylab = "Energy sub metering",
     xlab = ""
)

lines(input_data$timestamp, input_data$Sub_metering_2,
      col = "red")

lines(input_data$timestamp, input_data$Sub_metering_3,
      col = "blue")

legend("topright", lwd = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


# 3
plot(input_data$timestamp, input_data$Voltage,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime"
)

# 4
plot(input_data$timestamp, input_data$Global_reactive_power,
     type = "l",
     ylab = "Global_reactive_power",
     xlab = "datetime"
)

dev.off()