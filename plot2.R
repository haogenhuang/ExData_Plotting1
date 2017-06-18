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
png(filename = "plot2.png", width = 480, height = 480)

## commands for plot 2
plot(graphData$DateTime, graphData$Global_active_power, pch = ".", type ="l", ylab = "Global Active Power (kilowatts)", xlab = "")

## closing graphing device
dev.off()