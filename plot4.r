library(data.table)
library(dplyr)
##loading and subsetting dataset
housedata<-subset(read.table(file="household_power_consumption.txt",header = T,sep=";"),Date=="2/2/2007"|Date=="1/2/2007")

##coherecing date ,time and other variables
datetime <- strptime(paste(housedata$Date, housedata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
sub_metering_1<-as.numeric(housedata$Sub_metering_1)
sub_metering_2<-as.numeric(housedata$Sub_metering_2)
sub_metering_3<-as.numeric(housedata$Sub_metering_3)
Voltage<-as.numeric(housedata$Voltage)
Global_reactive_power<-as.numeric(housedata$Global_reactive_power)

##creating png file
png("plot4.png",width=480,height=480)

#making frame of 2 rows and 2 column using par function
par(mfrow=c(2,2))

##plotting the multiple base plot 

###plot 1
plot(datetime,Global_active_power,type='l',ylab = "Global Active Power",xlab="")

###plot 2
plot(datetime,Voltage,type='l')

###plot 3
plot(datetime,sub_metering_1,ylab = "Energy Sub Metering",type="l",col='black',xlab="")
lines(datetime,sub_metering_2,col='red')
lines(datetime,sub_metering_3,col='blue')
legend("topright",col=c("black","red","blue"),legend = c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,bty='n')

###plot 4
plot(datetime,Global_reactive_power,type = 'l')
dev.off()
