library(data.table)
library(dplyr)
##loading and subsetting dataset
housedata<-subset(read.table(file="household_power_consumption.txt",header = T,sep=";"),Date=="2/2/2007"|Date=="1/2/2007")
Global_active_power<-as.numeric(housedata$Global_active_power)

##creating png file 
png("plot1.png",width=480,height=480)

##making histogram
hist(Global_active_power,col='red',xlab = "Global Active Power (kilowatts)",main = "Global Active Power")
dev.off()
