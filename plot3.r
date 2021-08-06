library(data.table)
library(dplyr)
##loading and subsetting dataset
housedata<-subset(read.table(file="household_power_consumption.txt",header = T,sep=";"),Date=="2/2/2007"|Date=="1/2/2007")

##coherecing date ,time and submetering
datetime <- strptime(paste(housedata$Date, housedata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1<-as.numeric(housedata$Sub_metering_1)
sub_metering_2<-as.numeric(housedata$Sub_metering_2)
sub_metering_3<-as.numeric(housedata$Sub_metering_3)

##creating png file
png("plot3.png",width=480,height=480)

##plotting the multiple base plot 
plot(datetime,sub_metering_1,ylab = "Energy Sub Metering",type="l",col='black',xlab="")
lines(datetime,sub_metering_2,col='red')
lines(datetime,sub_metering_3,col='blue')
##adding legend to the plot
legend("topright",col=c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,cex = 0.8)

dev.off()
