# Use ggplot2
library(ggplot2)

# Read NEI, ACC RDS files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

# All coal combustion-related sources
coal_combustion_sources <- SCC[grepl("Fuel Comb.*Coal", SCC$EI.Sector),]

# Get emissions from coal combustion-related sources
coal_combustion_emmision <- NEI[(NEI$SCC %in% coal_combustion_sources$SCC),]

# Aggregate by year
emissions_year <- aggregate(Emissions ~ year, coal_combustion_emmision, sum)

png("plot4.png")

ggplot(emissions_year, aes(x = factor(year), y = Emissions, fill = year)) +
  geom_bar(stat = "identity") +
  xlab("year") +
  ylab(expression("Total PM2.5 emissions")) +
  ggtitle("Emissions from coal combustion-related sources")

dev.off()
