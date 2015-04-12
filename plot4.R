# Read data
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")

# Format Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset date to observation in 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates) 

# Format Time
data$Time <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

# Define File Name and plot dimension
png("plot4.png", width=480, height=480)
   
# Create 2x2 Plot
par(mfrow=c(2,2))
# (1,1)
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# (1,2)
plot(data$Time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
# (2,1)
plot(data$Time, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, box.lwd=0)
# (2,2)
plot(data$Time, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$Time, data$Global_reactive_power)

# Output to file
dev.off()
