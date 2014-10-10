Data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

Data$Datetime <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")

Data[,1] <- as.Date(Data[,1], format = "%d/%m/%Y")

subset <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

par(mfrow = c(2, 2))

plot(subset$Datetime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(subset$Datetime, subset$Voltage, type = "l", xlab = "", ylab = "Voltage")

plot(subset$Datetime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2, col = "red", type = "l")
lines(subset$Datetime, subset$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(subset$Datetime, subset$Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power", ylim = c(0, 0.5))



png()

png(filename = "./plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

plot(subset$Datetime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(subset$Datetime, subset$Voltage, type = "l", xlab = "", ylab = "Voltage")

plot(subset$Datetime, subset$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subset$Datetime, subset$Sub_metering_2, col = "red", type = "l")
lines(subset$Datetime, subset$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(subset$Datetime, subset$Global_reactive_power, type = "l", xlab = "", ylab = "Global_reactive_power", ylim = c(0, 0.5))

dev.off()

