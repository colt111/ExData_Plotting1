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