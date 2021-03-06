getDataFrame <- function(f) {
        rows <- 2100000
        myclass <- 'character'
        curr <- read.table(f,nrows=rows,sep=';',colClasses=myclass,header=T)
        curr$Date<-as.Date(curr$Date,format = '%d/%m/%Y')
        format <- '%Y-%m-%d %H:%M:%S'
        rawtime <- sprintf("%s %s", curr$Date, curr$Time)
        curr$Time <- strptime(rawtime, format = format)
        curr$Global_active_power <- as.numeric(curr$Global_active_power)
        curr$Global_reactive_power <- as.numeric(curr$Global_reactive_power)
        curr$Voltage <- as.numeric(curr$Voltage)
        curr$Global_intensity <- as.numeric(curr$Global_intensity)
        curr$Sub_metering_1 <- as.numeric(curr$Sub_metering_1)
        curr$Sub_metering_2 <- as.numeric(curr$Sub_metering_2)
        curr$Sub_metering_3 <- as.numeric(curr$Sub_metering_3)
        date1 <- as.Date.character('2007-02-01')
        date2 <- as.Date.character('2007-02-02')
        subset<-curr[curr$Date %in% c(date1, date2), ]
        subset
}

datafile <-'household_power_consumption.txt'
testdf<-getDataFrame(datafile)
par(mfrow = c(2,2))
plot(testdf$Time, testdf$Global_active_power, ylab = 'Global Active Power', xlab= '', type='l')
plot(testdf$Time, testdf$Voltage, ylab = 'Voltage', type = 'l', xlab ='')
plot(testdf$Time,testdf$Sub_metering_1, , xlab = '', ylab = 'Energy sub metering', type = 'n')
points(testdf$Time,testdf$Sub_metering_1, col = 'black', type = 'l')
points(testdf$Time,testdf$Sub_metering_2, col = 'red', type = 'l')
points(testdf$Time,testdf$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), pch='-', col = c('black', 'red', 'blue'))
plot(testdf$Time, testdf$Global_reactive_power, ylab = 'Global_reactive_power', xlab = 'datetime', type = 'l')
dev.copy(png, file = 'plot4.png')
dev.off()