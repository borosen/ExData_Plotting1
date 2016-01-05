library(dplyr)
header <- read.csv('household_power_consumption.txt', sep=';', nrow = 1)
consumption <- read.csv('household_power_consumption.txt', sep=';', skip = 66636, nrow = 1440 * 2,na.strings = '?')
names(consumption) <- names(header)
consumption <- mutate(consumption, datetime = paste(Date, Time))
consumption$datetime <- strptime(consumption$datetime, '%d/%m/%Y %H:%M:%S')

Sys.setlocale(locale="english")


png(file = 'plot4.png')
par(mfrow = c(2,2))
plot(consumption$datetime, consumption$Global_active_power, type = "l", ylab='Global Active Power', xlab=NA)

with(consumption, plot(datetime, Voltage, type = "l"))

plot(consumption$datetime, consumption$Sub_metering_1, type = "l", ylab='Energy sub metering', xlab=NA)
points(consumption$datetime, consumption$Sub_metering_2, type = "l", col = 'red')
points(consumption$datetime, consumption$Sub_metering_3, type = "l", col = 'blue')
legend('topright', lwd = 1, col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3') )

with(consumption, plot(datetime, Global_reactive_power, type = "l"))
dev.off()