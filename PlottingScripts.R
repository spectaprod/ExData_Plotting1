## read data
d <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## change Date from factor to date and filter for 2007-02-01 - 2007-02-02
library(lubridate)
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
## Plot 1
hist(gap, col = "red",xlab = "Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
## Plot 2
plot(t,gap,type="n", xlab="",ylab = "Global Active Power (kilowatts)")
lines(t,gap)
dev.copy(png,"plot2.png")
dev.off()
## Plot 3
plot(t,s1,type="n",ylab = "Energy sub metering", xlab="")
lines(t,s1)
lines(t,s2,col="red")
lines(t,s3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
## legend doesn't format properly and I cant figure out why for the life of me - if you know please leave a hint in your comments
dev.copy(png,"plot3.png")
dev.off()

## Plot 4
par(mfrow=c(2,2))
plot(t,gap,type="n", xlab="",ylab = "Global Active Power")
lines(t,gap)
plot(t,volts,type="n", xlab="datetime",ylab = "Voltage")
lines(t,volts)
plot(t,grp,type="n", xlab="",ylab = "Global_reactive_power")
lines(t,grp)
plot(t,s1,type="n",ylab = "Energy sub metering", xlab="datetime")
lines(s1)
lines(t,s1)
lines(t,s2,col="red")
lines(t,s3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),bty="n")
dev.copy(png,"plot4.png")
dev.off()


