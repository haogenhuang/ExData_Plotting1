## reading raw data from working directory
rawData <- read.csv("household_power_consumption.txt", sep = ";", na.string = "?")

## merging date and time columns and chaging to POSIXct
datetime <- as.POSIXct(paste(rawData$Date, rawData$Time), format="%d/%m/%Y %H:%M:%S")

## subsetting by date
daterange <- datetime >= "2007-02-1" & datetime < "2007-02-03"

## creating data for plotting
graphData <- data.frame(subset(datetime, daterange), subset(rawData[,3:9], daterange))
names(graphData) = c("DateTime", names(rawData)[3:9])

## initializing png graphic device
png(filename = "plot3.png", width = 480, height = 480)

## commands for plot 3
plot(graphData$DateTime, graphData$Sub_metering_1, type ="l", ylab = "Energy sub metering", xlab = "")
lines(graphData$DateTime, graphData$Sub_metering_2, col = "red")
lines(graphData$DateTime, graphData$Sub_metering_3, col = "blue")
legend("topright", lty = c(1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## closing graphic device
dev.off()