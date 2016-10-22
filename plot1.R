rm(list=ls(all=TRUE))
require(data.table)
data.set.total <- fread("household_power_consumption.txt",na.strings = "?")
data.set <- data.set.total[Date == "1/2/2007" | Date =="2/2/2007"]
png("plot1.png", width=480, height=480)
hist(data.set$Global_active_power,12,col="red",ylim=c(0,1200),
     xlab="Global active power (kilowatts)", ylab = "Frequency",
     main="Global Active Power")
dev.off()
