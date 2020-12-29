#reading data
data <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#reformat date and time column to date-time column "Mydate"
data <- mutate(data,Mydate=strptime(paste(Date,Time),format="%m/%d/%Y %H:%M:%S")) %>% filter(Mydate >= "2007-02-01" & Mydate <="2007-02-03")

#Plot histogram
png(filename="plot1.png",width = 480, height = 480, units = "px")
hist(data$Global_active_power,breaks=12,col="Red",xlab="Global_active_power (kilowatss)",main=" Global Sctive Power",xaxt="n",xlim =c(0,6))
axis(1,at=c(0,2,4,6))
dev.off()



