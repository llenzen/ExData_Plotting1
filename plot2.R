library(data.table)
library(lubridate)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
consumption.all <- fread("household_power_consumption.txt", na.strings = "?")
consumption <- subset(consumption.all, Date %in% c("1/2/2007", "2/2/2007"))
consumption$DateTime <- fast_strptime(paste(consumption$Date, consumption$Time, sep=" "), tz="", format="%d/%m/%Y %H:%M:%S", lt=FALSE)
png("plot2.png", width = 480, height = 480)
plot(as.numeric(Global_active_power)~DateTime, 
     data = consumption,
     type = "l",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
dev.off()
