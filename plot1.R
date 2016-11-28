#reading data
a<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")

#load dplyr package
library(dplyr)

#select rows lying between 1/2/2007 to 2/2/2007
b<-filter(a,grepl("^[1,2]/2/2007",a$Date))

#Construct histogram
hist(b$Global_active_power,col="red",xlab = "Global Active Power (Kilowatts)",main="Global Active Power")

#write to png file
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()

