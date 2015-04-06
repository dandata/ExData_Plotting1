data <- read.csv('household_power_consumption.txt', sep=';', stringsAsFactors=F)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data.play <- subset(data, Date == '2007-02-01' | Date == '2007-02-02')

png(file='plot1.png')
hist(as.numeric(data.play$Global_active_power), main="Global Active Power", col="#ff0000", xlab="Global Active Power (kilowatts)")
dev.off()