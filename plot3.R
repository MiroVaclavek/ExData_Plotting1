
###read data
data <- read.table("household_power_consumption.txt", sep=";", 
	header=TRUE, na.strings="?")

##subset the 2 days required
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##create variable to save typing later
gap <- data$Global_active_power

##create additional column with Date and Time in correct format in it for later use
data$datetime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))



###line color plot3.png

## set a plotting device
png(filename="plot3.png", width = 480, height = 480, units = "px")

## plot the first line with plot and add 2 lines with lines command
with(data, plot(datetime, Sub_metering_1, type = "l", lty = 1, xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_2,  type = "l", lty = 1, col="red"))
with(data, lines(datetime, Sub_metering_3,  type = "l", lty = 1, col="blue"))

## create legend for the chart
legend("topright", lty = c(1,1,1), col=c("black","red","blue"), 
	legend=c("Sub_metering_1","Sub_metering_3","Sub_metering_3"))

## turn off device to save the file
dev.off() 
