

df <- read.table("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE)
subSetData <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
rm(df)

subSetData$Date <- strptime(paste(subSetData$Date, subSetData$Time,
                            sep=" "), "%d/%m/%Y %H:%M:%S") 
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
subSetData$Sub_metering_1  <- as.numeric(subSetData$Sub_metering_1)
subSetData$Sub_metering_2  <- as.numeric(subSetData$Sub_metering_2)
subSetData$Sub_metering_3  <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
with(subSetData,
    {
      plot(Date, Sub_metering_1, type = "l" , ylab = "Energy Submetering", xlab = "")
      lines(Date, Sub_metering_2, type = "l", col = "red " )
      lines(Date, Sub_metering_3, type = "l", col = "blue " )
      legend("topright" ,
              c("Sub_metering_1", "Sub_metering_2" , "Sub_metering_3"),
              lty = 1, lwd = 2.5, col = c("black", "red", "blue" ))
    })
dev.off()