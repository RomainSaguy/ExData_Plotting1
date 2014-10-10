Data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

Data$Datetime <- strptime(paste(Data$Date, Data$Time), "%d/%m/%Y %H:%M:%S")

Data[,1] <- as.Date(Data[,1], format = "%d/%m/%Y")

subset <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

plot(subset$Datetime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


png()

png(filename = "./plot2.png", width = 480, height = 480)

plot(subset$Datetime, subset$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()

