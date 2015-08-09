library(data.table)

setwd("C:/Users/jgpolanc/Desktop/Coursera/c4p1/ExData_Plotting1")
mydata<- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")


mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S") 


## Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007
mydata2 <- mydata[mydata$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]


## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.

png("plot2.png",width=480, height=480)
plot(mydata2$DateTime, mydata2$Global_active_power,type = "l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()