library(dplyr)
header <- read.csv('household_power_consumption.txt', sep=';', nrow = 1)
consumption <- read.csv('household_power_consumption.txt', sep=';', skip = 66636, nrow = 1440 * 2,na.strings = '?')
names(consumption) <- names(header)
consumption <- mutate(consumption, DateTime = paste(Date, Time))
consumption$DateTime <- strptime(consumption$DateTime, '%d/%m/%Y %H:%M:%S')

Sys.setlocale(locale="english")


png(file = 'plot3.png')
plot(consumption$DateTime, consumption$Sub_metering_1, type = "l", ylab='Energy sub metering', xlab=NA)
points(consumption$DateTime, consumption$Sub_metering_2, type = "l", col = 'red')
points(consumption$DateTime, consumption$Sub_metering_3, type = "l", col = 'blue')
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') )
dev.off()