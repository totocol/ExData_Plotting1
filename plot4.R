#Read the table
powerdata <- read.table(unz('exdata-data-household_power_consumption.zip', 'household_power_consumption.txt', header = TRUE, sep=";", na.strings = "?", nrows=400000)
                        
powerdata$Date <- as.Date(powerdata$Date , "%d/%m/%Y") #Convert to right format
                        
powerdata$DateTime <- as.POSIXlt(paste(powerdata$Date, powerdata$Time, sep=" ")) 
                        
subsetdata <- subset(powerdata, Date == "2007-02-01" | Date == "2007-02-02",   ) #subset to the days we want
                        
png(file = "plot4.png")

par(mfrow = c(2,2)) #set up order

#plots 

plot(subsetdata$DateTime, subsetdata$Global_active_power, type="l", xlab=" ", ylab="Global Active Power")
plot(subsetdata$DateTime, subsetdata$Voltage, type="l", xlab=" ", ylab="Voltage")
plot(subsetdata$DateTime, subsetdata$Sub_metering_1, type="l", xlab=" ", ylab="Energy Sub Metering")
lines(subsetdata$DateTime, subsetdata$Sub_metering_2, col="red")
lines(subsetdata$DateTime, subsetdata$Sub_metering_3, col="blue")
legend("topright", lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3")  )
plot(subsetdata$DateTime, subsetdata$Global_reactive_power, type="l", xlab=" ", ylab="Global Reactive Power")


dev.off() #close device
