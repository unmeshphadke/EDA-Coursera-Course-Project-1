#The file has been downloaded in the current working directory.After unzipping it is saved as a text file.
f<-read.table("household_power_consumption.txt",sep=";",header=TRUE)

#Take data only for the 1st and 2nd Feb 2007.
df<-subset(f, Date=="1/2/2007"| Date=="2/2/2007")

#Convert the Global_Active_Power column to a numeric vector. 
df<-transform(df,Global_active_power=as.numeric(as.character(Global_active_power)))

#Open the png graphics device and save the plot in the file named plot1.png
png(file="plot1.png") #png graphic devices by default make 480 x 480 pixels files

#Plotting the histogram.
hist(df$Global_active_power,xlab="Global Active Power(in kilowatts)",col="red",main="Global Active Power")

#Dont forget to close the graphics device
dev.off()
