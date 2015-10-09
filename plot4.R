data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Date_Time is needed for the plot, Date is converted to enable subsetting
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date,"%d/%m/%Y")

# only interested in a small date range
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot4.png", height=480, width=480)

# 2x2 grouping of graphs
# graph 2 & 4 are new, graph 1 & 3 are from earlier with minor changes
par(mfrow = c(2, 2))
with(data, {
  # plot 1:
  plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  # plot 2:
  plot(Date_Time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  # plot 3:
  plot(Date_Time, Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
  points(Date_Time, Sub_metering_1, type = "l", col = "black")
  points(Date_Time, Sub_metering_2, type = "l", col = "red")
  points(Date_Time, Sub_metering_3, type = "l", col = "blue")
  legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  # plot 4:
  plot(Date_Time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.off()
