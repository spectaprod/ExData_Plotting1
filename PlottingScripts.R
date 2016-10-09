## read data
d <- read.table("household_power_consumption.txt", na.strings = "?", sep = ";", header = TRUE)
## change Date from factor to date and filter for 2007-02-01 - 2007-02-02
library(lubridate)
d$Date <- dmy(d$Date)
d1<- filter(d,Date == "2007-02-01" | Date == "2007-02-02")
d1$timestamp <- strptime(paste(d1$Date,d1$Time),format = "%Y-%m-%d %H:%M:%S")


gap <- as.numeric(d2$Global_active_power)/500
## Plot 1
hist(gap, col = "red",xlab = "Global Active Power (kilowatts)")

df3$timestamp <- strptime(paste(df3$Date,df3$Time),format = "%Y-%m-%d %H:%M:%S")
gap <- as.numeric(df3$Global_active_power)/500
t <- df3$timestamp
## Plot 2
plot(t,gap,type="n", xlab="",ylab = "Global Active Power (kilowatts)")
lines(t,gap)

## Plot 3
plot(t,s1,type="n",ylab = "Energy sub metering", xlab="")
lines(s1)
lines(t,s1)
lines(t,s2,col="red")
lines(t,s3,col="blue")

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



