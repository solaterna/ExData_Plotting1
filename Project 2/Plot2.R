# Read NEI, ACC RDS files
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

baltimore_emissions <- NEI[NEI$fips=="24510",]

# Aggregate emissions by year
baltimore_emissions_year <- aggregate(Emissions ~ year, baltimore_emissions, sum)

png('plot2.png')

plot(baltimore_emissions_year$year,
     baltimore_emissions_year$Emissions,
     type = "n",
     xlab = "Year",
     ylab = "Total Baltimore City PM2.5 Emission")

lines(baltimore_emissions_year$year, baltimore_emissions_year$Emissions)

dev.off()
