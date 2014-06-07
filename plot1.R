#Read in file and turn the date and time into the proper format
test <- read.table("./household_power_consumption.txt", header= TRUE, sep = ";")
test$datetime <- paste(test$Date, test$Time)
test$datetime <- strptime(test$datetime, format = "%d/%m/%Y %T")
test$Date <- as.Date(test$Date, format="%d/%m/%Y")

#Subset to the dates used
test <- test[test$Date==as.Date("2007-02-01") | test$Date==as.Date("2007-02-02"),]

#Convert data read in as factors to numerics
test$Global_active_power <- as.numeric(levels(test$Global_active_power))[test$Global_active_power]
test$Global_reactive_power <- as.numeric(levels(test$Global_reactive_power))[test$Global_reactive_power]
test$Global_intensity <- as.numeric(levels(test$Global_intensity))[test$Global_intensity]
test$Voltage <- as.numeric(levels(test$Voltage))[test$Voltage]
test$Sub_metering_1 <- as.numeric(levels(test$Sub_metering_1))[test$Sub_metering_1]
test$Sub_metering_2 <- as.numeric(levels(test$Sub_metering_2))[test$Sub_metering_2]
test$Sub_metering_3 <- as.numeric(levels(test$Sub_metering_3))[test$Sub_metering_3]

#Opens the PNG to plot into
png("plot1.png")

#Creates the actual historgram with the appropriate colour, breaks, and labeling
hist(test$Global_active_power, col="red", breaks=12, main="Global Active Power", xlab="Global Active Power (kilowatts)")

#Closes the PNG
dev.off()