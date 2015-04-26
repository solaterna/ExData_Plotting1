# Read data
data <- read.table("household_power_consumption.txt", header=TRUE,sep=";", colClasses=c("character", "character", rep("numeric",7)), na="?")
  
# Format Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset date to observation in 2007-02-01 and 2007-02-02
dates <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data <- subset(data, Date %in% dates)
 
# Define File Name and plot dimension
png("plot1.png", width=480, height=480)
    
# Plot histogram
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

# Output to file
dev.off()
