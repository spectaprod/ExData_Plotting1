library(lubridate)
library(dplyr)
## read data
d <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## change Date from factor to date and filter for 2007-02-01 - 2007-02-02
d$Date <- dmy(d$Date)
d1<- filter(d,Date == "2007-02-01" | Date == "2007-02-02")
d1$timestamp <- strptime(paste(d1$Date,d1$Time),format = "%Y-%m-%d %H:%M:%S")
## map plotting variables
gap <- d1$Global_active_power
volts <- d1$Voltage
t <- d1$timestamp
s1 <- d1$Sub_metering_1
s2 <- d1$Sub_metering_2
s3 <- d1$Sub_metering_3
grp <- d1$Global_reactive_power
## Plot 2
plot(t,gap,type="l", xlab="",ylab = "Global Active Power (kilowatts)")
dev.copy(png,"plot2.png")
dev.off()
