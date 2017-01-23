
###read data
data <- read.table("household_power_consumption.txt", sep=";", 
	header=TRUE, na.strings="?")

##subset the 2 days required
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##create variable to save typing later
gap <- data$Global_active_power

##create additional column with Date and Time in correct format in it for later use
data$datetime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))




### 4 line plot4.png

## set a plotting device
png(filename="plot4.png", width = 480, height = 480, units = "px")

## set plot layout to be 2x2 matrix
par(mfrow=c(2,2))

## chart 1
with(data, plot(datetime, gap, type = "l", lty = 1, xlab="", 
		ylab="Global Active Power"))

## chart 2
with(data, plot(datetime, Voltage, type = "l", lty = 1))

## chart 3
with(data, plot(datetime, Sub_metering_1, type = "l", lty = 1, xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_2,  type = "l", lty = 1, col="red"))
with(data, lines(datetime, Sub_metering_3,  type = "l", lty = 1, col="blue"))

legend("topright", bty="n", lty = c(1,1,1), col=c("black","red","blue"), 
	legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"))

## chart 4
with(data, plot(datetime, Global_reactive_power, type = "l", lty = 1))

## turn off device to save the file
dev.off() 