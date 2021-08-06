library(data.table)
library(dplyr)
##loading and subsetting dataset
housedata<-subset(read.table(file="household_power_consumption.txt",header = T,sep=";"),Date=="2/2/2007"|Date=="1/2/2007")
Global_active_power<-as.numeric(housedata$Global_active_power)

##coherecing date and time
datetime <- strptime(paste(housedata$Date, housedata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##creating png file
png("plot2.png",width=480,height=480)
##plotting the graph 
plot(datetime,Global_active_power,type = 'l',ylab = "Global Active Power (kilowatts)",xlab="")
dev.off()
