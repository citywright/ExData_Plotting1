# This script reads in the data, cleans it up, and creates Plot 2

data <-  read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", nrows=2880, skip=66636, stringsAsFactors=FALSE)
names <- read.table("household_power_consumption.txt", sep=";", nrows=1,
                    stringsAsFactors=FALSE)
colnames(data) <- names
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png", width=480, height=480, bg="transparent")
with(data, plot(datetime, Global_active_power, type="l", lwd=1, 
                ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
