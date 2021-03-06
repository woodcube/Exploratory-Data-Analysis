Sys.setlocale('LC_ALL', 'C')
library(dplyr)

df <- read.table('data/household_power_consumption.txt', header=T, sep=';',
                 na.strings='?', nrows=2075259, stringsAsFactors=F)

df <- df[df$Date %in% c('1/2/2007', '2/2/2007'),]

dates <- paste(df$Date, df$Time)
df$DateTime <- strptime(dates, '%d/%m/%Y %H:%M:%S')

df <- select(df, DateTime, Global_active_power:Sub_metering_3)


windows(height=480, width=480)
with(df, {
    plot(DateTime, Sub_metering_1, type='l',
         xlab='', ylab='Energy sub metering')
    lines(DateTime, Sub_metering_2, type='l', col='red')
    lines(DateTime, Sub_metering_3, type='l', col='blue')
    legend("topright", lty=1, lwd=2, cex=0.9,
           col=c("black", "red", "blue"), 
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()