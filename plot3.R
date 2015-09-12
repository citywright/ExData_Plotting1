# This script reads in the data, cleans it up, and creates Plot 3

data <-  read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", nrows=2880, skip=66636, stringsAsFactors=FALSE)
names <- read.table("household_power_consumption.txt", sep=";", nrows=1,
                    stringsAsFactors=FALSE)
colnames(data) <- names
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot3.png", width=480, height=480, bg="transparent")
with(data, plot(datetime, Sub_metering_1, type="l", lwd=1, col="black", 
                ylab="Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_2, type="l", lwd=1, col="red"))
with(data, lines(datetime, Sub_metering_3, type="l", lwd=1, col="blue"))
legend("topright", lwd=1, col=c("black","red","blue"), 
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
