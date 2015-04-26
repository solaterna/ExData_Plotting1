# Read NEI, ACC RDS files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

total_emissions <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')

plot(total_emissions$year, 
     total_emissions$Emissions, 
     type = "n", 
     xlab = "Year", 
     ylab = "Total PM2.5 Emission")

lines(total_emissions$year, total_emissions$Emissions)

dev.off()
