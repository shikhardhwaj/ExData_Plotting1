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

#Creates plot of date/time v Sub metering 1 data
plot(b$Timestamp,b$Sub_metering_1,type="l",xlab = "",ylab = "Energy sub metering")
#Adds line graph for date/time v Sub metering 2 data in red
lines(b$Timestamp,b$Sub_metering_2,type="l",col="red")
#Adds line graph for date/time v Sub metering 3 data in red
lines(b$Timestamp,b$Sub_metering_3,type="l",col="blue")
#adds legend to plot
legend("topright",lty=1,col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


#write to png file
dev.copy(png,file="plot3.png",height=480,width=480)
dev.off()

