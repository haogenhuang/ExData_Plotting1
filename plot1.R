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
png(filename = "plot1.png", width = 480, height = 480)

## Commands for Plot 1
hist(graphData$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

## closing graphic device
dev.off()