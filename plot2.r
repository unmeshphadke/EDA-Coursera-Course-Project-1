#The file has been downloaded in the current working directory.After unzipping it is saved as a text file.
f<-read.csv("household_power_consumption.txt",sep=";",header=TRUE)

#Take data only for the 1st and 2nd Feb 2007.
d<-subset(f,Date=="1/2/2007"| Date=="2/2/2007")

#Convert the Global_Active_Power column to a numeric vector. 
d<-transform(d,Global_active_power=as.numeric(as.character(Global_active_power)))

#Concatenate the date and time columns into a single DateTime column
d$DateTime<-paste(d$Date,d$Time,sep=" ")

#Use strptime to convert the DateTime to POSIXlt object
d$DateTime<-strptime(d$DateTime, "%d/%m/%Y %H:%M:%S")

#Open  the png graphics device. Target file is created by the name of plot2.png.
png(file="plot2.png")
#Plotting the Data. type="l" implies that the garph is a line chart.
plot(d$DateTime,d$Global_active_power,type="l",ylab="Global Active Power(in kilowatts)",xlab="")
#lines(day$Date,day$Global_active_power,type="l")

#Close the device
dev.off()