temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', temp, method='curl')
data <- read.csv(unz(temp, 'household_power_consumption.txt'), sep=';', stringsAsFactors=F, na.strings='?')
unlink(temp)

data.play <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
data.play$Datetime <- strptime(paste(data.play$Date, data.play$Time), format="%d/%m/%Y %H:%M:%S")

png(file='plot2.png')
plot(data.play$Datetime, as.numeric(data.play$Global_active_power), main="", type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()