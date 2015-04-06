data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=F)
data.play <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
data.play$Datetime <- strptime(paste(data.play$Date, data.play$Time), format="%d/%m/%Y %H:%M:%S")

png(file='plot2.png')
plot(data.play$Datetime, as.numeric(data.play$Global_active_power), main="", type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()