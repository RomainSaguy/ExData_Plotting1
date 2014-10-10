Data <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";")

Data[,1] <- as.Date(Data[,1], format = "%d/%m/%Y")

subset <- Data[Data$Date == "2007-02-01" | Data$Date == "2007-02-02",]

subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))

hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")


png()

png(filename = "./plot1.png", width = 480, height = 480)

hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")

dev.off()

