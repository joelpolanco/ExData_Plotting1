library(data.table)

setwd("C:/Users/jgpolanc/Desktop/Coursera/c4p1/ExData_Plotting1")
mydata<- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings = "?")


mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
mydata$DateTime <- strptime(paste(mydata$Date,mydata$Time),"%Y-%m-%d %H:%M:%S") 


## Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007
mydata2 <- mydata[mydata$Date %in% as.Date(c('2007-02-01', '2007-02-02')),]


## Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.


png("plot4.png",width=480, height=480)
par(mfrow=c(2,2))
plot(mydata2$DateTime, mydata2$Global_active_power,type = "l", xlab="",ylab="Global Active Power")
plot(mydata2$DateTime, mydata2$Voltage,type = "l", xlab="datetime",ylab="Voltage")
with(mydata2,plot(DateTime,Sub_metering_1, type="l",xlab="",ylab="Energy sub metering"))
with(mydata2 , points(DateTime,Sub_metering_2,type="l",col="red"))
with(mydata2 , points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty="solid",bty="n")
plot(mydata2$DateTime, mydata2$Global_reactive_power,type = "l", xlab="datetime",ylab="Global_reactive_power")
dev.off()