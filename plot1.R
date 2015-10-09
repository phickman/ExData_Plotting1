# load the data & fix the data type of the date column to enable subsetting
data <- read.table("../household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

data$Date = as.Date(data$Date,"%d/%m/%Y")

# only interested in a small date range
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot1.png", height=480, width=480)

hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#dev.copy(png,file="plot1.png")
dev.off()
