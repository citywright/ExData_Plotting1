# This script reads in the data, cleans it up, and creates Plot 1

data <-  read.table("household_power_consumption.txt", header=TRUE, 
                    sep=";", nrows=2880, skip=66636, stringsAsFactors=FALSE)
names <- read.table("household_power_consumption.txt", sep=";", nrows=1,
                    stringsAsFactors=FALSE)
colnames(data) <- names
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png(file="plot1.png", width=480, height=480, bg="transparent")
hist(data$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)") 
dev.off()


