header <- read.csv('household_power_consumption.txt', sep=';', nrow = 1)
consumption <- read.csv('household_power_consumption.txt', sep=';', skip = 66636, nrow = 1440 * 2,na.strings = '?')
names(consumption) <- names(header)
consumption$Date <- as.Date(strptime(consumption$Date, '%d/%m/%Y'))


png(file = 'plot1.png')
hist(consumption$Global_active_power, col='red', main = 'Global Active Power', xlab = 'Global Active Power (kilowatts)')
dev.off()
