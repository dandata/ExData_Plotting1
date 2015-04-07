temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', temp, method='curl')
data <- read.csv(unz(temp, 'household_power_consumption.txt'), sep=';', stringsAsFactors=F, na.strings='?')
unlink(temp)

data.play <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
data.play$Datetime <- strptime(paste(data.play$Date, data.play$Time), format="%d/%m/%Y %H:%M:%S")

png(file='plot3.png')
plot(data.play$Datetime, as.numeric(data.play$Sub_metering_1), main="", type="l", ylab="Energy sub metering", xlab="")
lines(data.play$Datetime, as.numeric(data.play$Sub_metering_2), col="#ff0000", type="l")
lines(data.play$Datetime, as.numeric(data.play$Sub_metering_3), col="#0000ff", type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("#000000", "#ff0000", "#0000ff"), lwd=1)
dev.off()