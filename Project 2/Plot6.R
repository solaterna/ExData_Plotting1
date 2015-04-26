# Use ggplot2
library(ggplot2)

# Read NEI, ACC RDS files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# Aggregate Baltimore emissions from motor vehicle sources by year
baltimore_motor_emissions <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"),]
baltimore_motor_emissions_year <- aggregate(Emissions ~ year, baltimore_motor_emissions, sum)

# Aggregate Los Angeles emissions from motor vehicle sources by year
la_motor_emissions <- NEI[(NEI$fips == "06037") & (NEI$type == "ON-ROAD"),]
la_motor_emissions_year <- aggregate(Emissions ~ year, la_motor_emissions, sum)

# Label county
baltimore_motor_emissions_year$county <- "Baltimore City"
la_motor_emissions_year$county <- "Los Angeles County"

combine_emission <- rbind(baltimore_motor_emissions_year, la_motor_emissions_year)

png("plot6.png")

ggplot(combine_emission, aes(x = factor(year), y = Emissions, fill = county)) +
  geom_bar(stat = "identity") +
  xlab("year") +
  ylab(expression("Total PM2.5 emissions")) +
  ggtitle("Emissions from motor in baltimore city")

dev.off()
