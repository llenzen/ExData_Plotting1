library(data.table)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
consumption.all <- fread("household_power_consumption.txt", na.strings = "?")
consumption <- subset(consumption.all, Date %in% c("1/2/2007", "2/2/2007"))
consumption$DateTime <- fast_strptime(paste(consumption$Date, consumption$Time, sep=" "), tz="", format="%d/%m/%Y %H:%M:%S", lt=FALSE)

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))
plot(as.numeric(Global_active_power)~DateTime, 
     data = consumption,
     type = "l",
     ylab = "Global Active Power",
     xlab = "")

plot(Voltage~DateTime, 
     data = consumption,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

plot(Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ DateTime, 
     data = consumption,
     type = "n",
     ylab = "Energy sub metering",
     xlab = "",
     ylim = c(0,40),
     cex.lab = 0.75)

lines(Sub_metering_1 ~ DateTime, 
      data = consumption,
      col = "black" )

lines(Sub_metering_2 ~ DateTime, 
      data = consumption,
      col = "red" )

lines(Sub_metering_3 ~ DateTime, 
      data = consumption,
      col = "blue" )

legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"),
       bty = "n",
       lty = 1,
       cex=0.5)

plot(Global_reactive_power~DateTime, 
     data = consumption,
     type = "l",
     xlab = "datetime")

dev.off()