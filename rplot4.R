#reading data
data <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#reformat date and time column to date-time column "Mydate"
data <- mutate(data,Mydate=strptime(paste(Date,Time),format="%m/%d/%Y %H:%M:%S")) %>% filter(Mydate >= "2007-02-01" & Mydate <="2007-02-03")
#reshape data for 3rd plot
data_new <- data %>% select (Mydate,Sub_metering_1,Sub_metering_2,Sub_metering_3) %>% melt(id="Mydate")
#Plot png
png(filename="plot4.png",width = 480, height = 480, units = "px")

#canvas
par(mfcol=c(2,2), mar=c(4,4,1,1))

#plot 1
plot(data$Mydate,data$Global_active_power,type="l", xlab ="", ylab="Global Active Power (kilowatts)")

#plot 2
plot(data_new$Mydate,data_new$value,type="n",ylab="Energy sub metering",xlab="",ylim=c(0,30))
points(data_new$Mydate[data_new$variable=="Sub_metering_1"],data_new$value[data_new$variable=="Sub_metering_1"],type="l",col="Black",lwd=2)
points(data_new$Mydate[data_new$variable=="Sub_metering_2"],data_new$value[data_new$variable=="Sub_metering_2"],type="l",col="Red")
points(data_new$Mydate[data_new$variable=="Sub_metering_3"],data_new$value[data_new$variable=="Sub_metering_3"],type="l",col="Blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

#plot 3 and 4
plot(data$Mydate,data$Voltage,type="l", xlab ="datetime", ylab="Voltage")
plot(data$Mydate,data$Global_reactive_power,type="l", xlab ="datetime", ylab="Global_rective_power")


dev.off()
