
data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

# Date_Time is needed for the plot, Date is converted to enable subsetting
data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date,"%d/%m/%Y")

# only interested in a small date range
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot2.png", height=480, width=480)

plot(data$Date_Time, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
