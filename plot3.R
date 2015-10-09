
data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Date_Time is needed for the plot, Date is converted to enable subsetting
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date,"%d/%m/%Y")

# only interested in a small date range
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot3.png", height=480, width=480)

# start with a blank plot and add the coloured lines and legend separately
plot(data$Date_Time, data$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
points(data$Date_Time, data$Sub_metering_1, type = "l", col = "black")
points(data$Date_Time, data$Sub_metering_2, type = "l", col = "red")
points(data$Date_Time, data$Sub_metering_3, type = "l", col = "blue")

legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
