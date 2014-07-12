plot1 <- function() {
	## Change the x-axis names to englishs via setting the system locale
 	Sys.setlocale("LC_TIME", "English")

	## Load the data from the dates 2007-02-01 and 2007-02-02
	file <- "household_power_consumption.txt"
	data <- read.table(file, header=TRUE, sep=";", na.strings="?")
	data$Date <- as.Date(strptime(data$Date, "%d/%m/%Y"))
	filter_data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")

	## Make Plot
	hist(filter_data$Global_active_power, col = "red", 
		main="Global Active Power", 
		xlab="Global Active Power (kilowatts)")
	dev.copy(device=png, width=480, height=480, file="plot1.png")
     	dev.off()
}