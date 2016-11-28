#reading data
a<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE,na.strings = "?")

#load dplyr package
library(dplyr)

#select rows lying between 1/2/2007 to 2/2/2007
b<-filter(a,grepl("^[1,2]/2/2007",a$Date))

#add data and time to form a new column
b$Timestamp<-paste(b$Date,b$Time)

#Convert data and Time to standard format using strptime
b$Timestamp<-strptime(b$Timestamp,format="%d/%m/%Y %H:%M:%S")

#plot Timestamp v/s Global active power
plot(b$Timestamp, b$Global_active_power, type='l',ylab = "Global Active Power(kilowatts)",xlab="")

#write to png file
dev.copy(png,file="plot2.png",height=480,width=480)
dev.off()

