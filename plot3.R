#Read the table
powerdata <- read.table(unz('exdata-data-household_power_consumption.zip', 'household_power_consumption.txt', header = TRUE, sep=";", na.strings = "?", nrows=400000)

powerdata$Date <- as.Date(powerdata$Date , "%d/%m/%Y") #Convert to right format

powerdata$DateTime <- as.POSIXlt(paste(powerdata$Date, powerdata$Time, sep=" ")) 

subsetdata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02",   ) #subset to the days we want

png(file = "plot3.png")

plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type="l", xlab=" ", ylab="Global Active Power (kilowatts)")

dev.off() #close device 