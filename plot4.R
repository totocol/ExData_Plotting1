powerdata <- read.table('household_power_consumption.txt', header = TRUE, sep=";", na.strings = "?", nrows=400000)
powerdata$Date <- as.Date(powerdata$Date , "%d/%m/%Y")
powerdata$Time <- strptime(powerdata$Time, "%H:%M:%S")
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02",   )
