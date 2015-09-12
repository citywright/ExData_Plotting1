# This script reads in the data, cleans it up, and creates Plot 4

data <-  read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", nrows=2880, skip=66636, stringsAsFactors=FALSE)
names <- read.table("household_power_consumption.txt", sep=";", nrows=1,
                    stringsAsFactors=FALSE)
colnames(data) <- names
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot4.png", width=480, height=480, bg="transparent")
par(mfcol=c(2,2))

#Upper Left
with(data, plot(datetime, Global_active_power, type="l", lwd=1, 
                ylab="Global Active Power", xlab=""))

#Lower Left
with(data, plot(datetime, Sub_metering_1, type="l", lwd=1, col="black", 
                ylab="Energy sub metering", xlab=""))
with(data, lines(datetime, Sub_metering_2, type="l", lwd=1, col="red"))
with(data, lines(datetime, Sub_metering_3, type="l", lwd=1, col="blue"))
legend("topright", lwd=1, col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Upper Right
with(data, plot(datetime, Voltage, type="l"))

#Lower Right
with(data, plot(datetime, Global_reactive_power, type="l"))

dev.off()
