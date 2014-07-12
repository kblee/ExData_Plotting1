plot3 <- function() {
	## Change the x-axis names to englishs via setting the system locale
 	Sys.setlocale("LC_TIME", "English")

	## Load the data from the dates 2007-02-01 and 2007-02-02
	file <- "household_power_consumption.txt"
	data <- read.table(file, header=TRUE, sep=";", na.strings="?")
	data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
	filter_data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

	## Make Plot
	filter_data$datetime <- as.POSIXlt(paste(filter_data$Date, 
							filter_data$Time))
	with(filter_data, plot(datetime, Sub_metering_1, col="black", 
		xlab="", ylab="Energy sub metering", type="l"))
	with(filter_data, lines(datetime, Sub_metering_2, col="red"))
	with(filter_data, lines(datetime, Sub_metering_3, col="blue"))
	legend("topright", lwd=1, col=c("black","red","blue"), 
			legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
	dev.copy(device=png, width=480, height=480, file="plot3.png")
     	dev.off()
}