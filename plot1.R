


df <- read.table("household_power_consumption.txt",
                 header=TRUE,
                 sep=";",
                 stringsAsFactors=FALSE)
subSetData <- data[df$Date %in% c("1/2/2007","2/2/2007") ,]
rm(df)

#str(subSetData)
subSetData$Global_active_power <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
with(subSetData, 
     hist(Global_active_power,
          col="red",
          main="Global Active Power",
          xlab="Global Active Power (kilowatts)"))
dev.off()