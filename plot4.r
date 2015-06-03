#The file has been downloaded in the current working directory.After unzipping it is saved as a text file.
f<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

#Take data only for the 1st and 2nd Feb 2007.
d<-subset(f,Date=="1/2/2007"| Date=="2/2/2007")

#Convert the relevant columns to  numeric vectors. 
d<-transform(d,Sub_metering_1=as.numeric(as.character(Sub_metering_1)))
d<-transform(d,Sub_metering_2=as.numeric(as.character(Sub_metering_2)))
d<-transform(d,Sub_metering_3=as.numeric(as.character(Sub_metering_3)))
d<-transform(d,Global_active_power=as.numeric(as.character(Global_active_power)))
d<-transform(d,Voltage=as.numeric(as.character(Voltage)))
d<-transform(d,Global_reactive_power=as.numeric(as.character(Global_reactive_power)))


#Concatenate the date and time columns into a single DateTime column
d$DateTime<-paste(d$Date,d$Time,sep=" ")

#Use strptime to convert the DateTime to POSIXlt object
d$DateTime<-strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

#Open  the png graphics device. Target file is created by the name of plot3.png.
png(file="plot4.png")

#Setting the matrix for th plots.
par(mfrow=c(2,2))

#Plotting
plot(d$DateTime,d$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(d$DateTime,d$Voltage,type="l",ylab="Voltage",xlab="datetime")

#Plot 3
plot(d$DateTime,d$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(d$DateTime,d$Sub_metering_2,type = "l",col="red")
lines(d$DateTime,d$Sub_metering_3,type="l",col="blue")

#Now the legend for plot 3
legend("topright",col=c("black","red","blue"),lty=1,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

#Last plot
plot(d$DateTime,d$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")

#Close the device
dev.off()
  
