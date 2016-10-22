rm(list=ls(all=TRUE))
require(data.table)
data.set.total <- fread("household_power_consumption.txt",na.strings = "?")
data.set <- as.data.frame(data.set.total[Date == "1/2/2007" | Date =="2/2/2007"])
data.set$datetime <- 
        strptime(paste(data.set$Date,data.set$Time),"%d/%m/%Y %H:%M:%S")

png("plot3.png", width=480, height=480)
plot(data.set$datetime,data.set$Sub_metering_1, type="l",
     xlab="", ylab = "Energy Sub Metering")
lines(data.set$datetime,data.set$Sub_metering_2, col="red")
lines(data.set$datetime,data.set$Sub_metering_3, col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1)
dev.off()
