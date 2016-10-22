rm(list=ls(all=TRUE))
require(data.table)
data.set.total <- fread("household_power_consumption.txt",na.strings = "?")
data.set <- as.data.frame(data.set.total[Date == "1/2/2007" | Date =="2/2/2007"])
data.set$datetime <- 
        strptime(paste(data.set$Date,data.set$Time),"%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(data.set$datetime,data.set$Global_active_power, type="l",
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()
