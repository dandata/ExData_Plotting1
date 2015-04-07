temp <- tempfile()
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', temp, method='curl')
data <- read.csv(unz(temp, 'household_power_consumption.txt'), sep=';', stringsAsFactors=F, na.strings='?')
unlink(temp)

data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.play <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

png(file='plot1.png')
hist(as.numeric(data.play$Global_active_power), main="Global Active Power", col="#ff0000", xlab="Global Active Power (kilowatts)")
dev.off()