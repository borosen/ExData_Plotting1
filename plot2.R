library(dplyr)
header <- read.csv('household_power_consumption.txt', sep=';', nrow = 1)
consumption <- read.csv('household_power_consumption.txt', sep=';', skip = 66636, nrow = 1440 * 2,na.strings = '?')
names(consumption) <- names(header)
consumption <- mutate(consumption, DateTime = paste(Date, Time))
consumption$DateTime <- strptime(consumption$DateTime, '%d/%m/%Y %H:%M:%S')

Sys.setlocale(locale="english")


png(file = 'plot2.png')
plot(consumption$DateTime, consumption$Global_active_power, type = "l", ylab='Global Active Power (kilowatts)', xlab=NA)
dev.off()
