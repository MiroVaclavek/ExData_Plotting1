
###read data
data <- read.table("household_power_consumption.txt", sep=";", 
	header=TRUE, na.strings="?")

##subset the 2 days required
data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##create variable to save typing later
gap <- data$Global_active_power

##create additional column with Date and Time in correct format in it for later use
data$datetime <- with(data, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))



###line plot2.png

## set a plotting device
png(filename="plot2.png", width = 480, height = 480, units = "px")

## plot the line chart
with(data, plot(datetime, gap, type = "l", lty = 1, xlab="", 
		ylab="Global Active Power (kilowatts)"))

## turn off device to save the file
dev.off() 