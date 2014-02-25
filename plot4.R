

df <- read.table("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE)
subSetData <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
rm(df)

subSetData$Date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
subSetData$Global_reactive_power <- as.numeric(subSetData$Global_reactive_power)
subSetData$Voltage <- as.numeric(subSetData$Voltage)
subSetData$Sub_metering_1 <- as.numeric(subSetData$Sub_metering_1)
subSetData$Sub_metering_2 <- as.numeric(subSetData$Sub_metering_2)
subSetData$Sub_metering_3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

with(subSetData,
     {
       
     plot(Date, Global_active_power, type="l", xlab="",
          ylab="Global Active Power (kilowatts)")
     
     plot(Date, Voltage, type="l", xlab="datetime", ylab="Voltage")
     
     plot(Date, Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
        lines(Date, Sub_metering_2, type="l", col="red")
        lines(Date, Sub_metering_3, type="l", col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
     
     plot(Date, Global_reactive_power, type="l",
          xlab="datetime", ylab="Global_reactive_power")
    })

dev.off()