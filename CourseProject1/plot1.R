library(dplyr)

df <- read.table('data/household_power_consumption.txt', header=T, sep=';',
                  na.strings='?', nrows=2075259, stringsAsFactors=F)

df <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]

dates <- paste(df$Date, df$Time)
df$DateTime <- strptime(dates, '%d/%m/%Y %H:%M:%S')

df <- select(df, DateTime, Global_active_power:Sub_metering_3)

with(df, hist(Global_active_power, main='Global Active Power', xlab='Global Active Power(kilowatts)', ylab='Frequency', col='red'))

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()