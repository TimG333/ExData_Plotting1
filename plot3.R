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
png("plot3.png")

#Creates the chart with appropriate lables and appropriate lines across
plot(test$datetime,test$Sub_metering_1, col="black", xlab="", ylab="Energy sub metering", type="l")
points(test$datetime,test$Sub_metering_2, col="red", type="l")
points(test$datetime,test$Sub_metering_3, col="blue", type="l")

#Creates the legend
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))

#Closes the PNG
dev.off()
