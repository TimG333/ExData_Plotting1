#Read in file and turn the date and time into the proper format
test <- read.table("./household_power_consumption.txt", header= TRUE, sep = ";")
test$datetime <- paste(test$Date, test$Time)
test$datetime <- strptime(test$datetime, format = "%d/%m/%Y %T")
test$Date <- as.Date(test$Date, format="%d/%m/%Y")

#Convert data read in as factors to numerics
test$Global_active_power <- as.numeric(levels(test$Global_active_power))[test$Global_active_power]
test$Global_reactive_power <- as.numeric(levels(test$Global_reactive_power))[test$Global_reactive_power]
test$Global_intensity <- as.numeric(levels(test$Global_intensity))[test$Global_intensity]
test$Voltage <- as.numeric(levels(test$Voltage))[test$Voltage]
test$Sub_metering_1 <- as.numeric(levels(test$Sub_metering_1))[test$Sub_metering_1]
test$Sub_metering_2 <- as.numeric(levels(test$Sub_metering_2))[test$Sub_metering_2]
test$Sub_metering_3 <- as.numeric(levels(test$Sub_metering_3))[test$Sub_metering_3]

#Opens the PNG to plot into
png("plot4.png")

#Sets needed parameters
par(mfrow=c(2,2),mar=c(3,4,3,3))

#Plots the charts
#Top left
plot(test$datetime, test$Global_active_power, type="l", xlab="", ylab="Global Active Power")
#Top right
plot(test$datetime, test$Voltage, type="l", xlab="datetime", ylab="Voltage")
#Bottom left
plot(test$datetime,test$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l")
points(test$datetime,test$Sub_metering_2, col="red", type="l")
points(test$datetime,test$Sub_metering_3, col="blue", type="l")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), bty="n")
#Bottom right
plot(test$datetime, test$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Closes the PNG
dev.off()