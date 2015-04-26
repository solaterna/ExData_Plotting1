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
png("plot2.png", width=480, height=480)
   
# Plot
plot(data$Time, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Output to file
dev.off()
