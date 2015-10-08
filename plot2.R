
data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##data$Date_Time = strptime(paste(data$Date, data$Time),"%d/%m/%Y %H:%M:%S")
data$Date = as.Date(data$Date,"%d/%m/%Y")

data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", height=480, width=480)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#dev.copy(png,file="plot1.png")
dev.off()
