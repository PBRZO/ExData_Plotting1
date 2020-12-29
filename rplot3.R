#reading data
data <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#reformat date and time column to date-time column "Mydate"
data <- mutate(data,Mydate=strptime(paste(Date,Time),format="%m/%d/%Y %H:%M:%S")) %>% filter(Mydate >= "2007-02-01" & Mydate <="2007-02-03")

#Plot histogram
png(filename="plot3.png",width = 480, height = 480, units = "px")
data_new <- data %>% select (Mydate,Sub_metering_1,Sub_metering_2,Sub_metering_3) %>% melt(id="Mydate")
plot(data_new$Mydate,data_new$value,type="n",ylab="Energy sub metering",xlab="",ylim=c(0,30))
points(data_new$Mydate[data_new$variable=="Sub_metering_1"],data_new$value[data_new$variable=="Sub_metering_1"],type="l",col="Black",lwd=2)
points(data_new$Mydate[data_new$variable=="Sub_metering_2"],data_new$value[data_new$variable=="Sub_metering_2"],type="l",col="Red")
points(data_new$Mydate[data_new$variable=="Sub_metering_3"],data_new$value[data_new$variable=="Sub_metering_3"],type="l",col="Blue")
legend("topright",legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()
