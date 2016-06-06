library(data.table)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
unzip("household_power_consumption.zip")
consumption.all <- fread("household_power_consumption.txt", na.strings = "?")
consumption.all$Date <- as.Date(consumption.all$Date, "%d/%m/%Y")
consumption <- subset(consumption.all, Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")))
png("plot1.png", width = 480, height = 480)
hist(as.numeric(consumption$Global_active_power), 
     freq = TRUE, 
     breaks = 12, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
