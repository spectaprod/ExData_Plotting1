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
## Plot 4
## establish matrix
par(mfrow=c(2,2))
## top left
plot(t,gap,type="l", xlab="",ylab = "Global Active Power")
## top right
plot(t,volts,type="l", xlab="datetime",ylab = "Voltage")
## bottom left
plot(t,s1,type="l",ylab = "Energy sub metering", xlab="")
lines(t,s1)
lines(t,s2,col="red")
lines(t,s3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
## bottom right
plot(t,grp,type="n", xlab="datetime",ylab = "Global_reactive_power")
lines(t,grp)
dev.copy(png,"plot4.png")
dev.off()