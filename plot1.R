powerdata <- read.table(unz('exdata-data-household_power_consumption.zip', 'household_power_consumption.txt', header = TRUE, sep=";", na.strings = "?", nrows=400000)
powerdata$Date <- as.Date(powerdata$Date , "%d/%m/%Y") #convert dates 
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02",   ) #subset needed data
png(file = "plot1.png") #Create file 
hist(powerdata$Global_active_power, col = 'red', xlab = "Global Active Power (kilowatts)", main = paste("Global Active Power"))
dev.off() #close device


