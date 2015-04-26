# Use ggplot2
library(ggplot2)

# Read NEI, ACC RDS files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore_emissions <- NEI[NEI$fips=="24510",]

# Aggregate baltimore emissions by year and source
baltimore_emissions_source <- aggregate(Emissions ~ year + type, data = baltimore_emissions, FUN = sum)

png("plot3.png", height = 600, width = 800)

ggplot(baltimore_emissions_source, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(. ~ type) +
  xlab("year") +
  ylab(expression("Total PM2.5 emission")) +
  ggtitle(expression("PM2.5 emissions in Baltimore City by source"))

dev.off()
