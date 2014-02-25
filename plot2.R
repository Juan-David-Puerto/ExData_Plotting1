

df <- read.table("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE)
subSetData <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
rm(df)


subSetData$Date <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
with(subSetData, 
plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
