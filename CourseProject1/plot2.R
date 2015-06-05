library(dplyr)

df <- read.table('data/household_power_consumption.txt', header=T, sep=';',
                 na.strings='?', nrows=2075259, stringsAsFactors=F)

df <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]

dates <- paste(df$Date, df$Time)
df$DateTime <- strptime(dates, '%d/%m/%Y %H:%M:%S')

df <- select(df, DateTime, Global_active_power:Sub_metering_3)

Sys.setlocale('LC_ALL', 'C')
with(df, plot(DateTime, Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'))

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()