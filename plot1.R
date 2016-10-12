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
t <- d1$timestamp
## Plot 1
hist(gap, col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.copy(png,"plot1.png")
dev.off()
