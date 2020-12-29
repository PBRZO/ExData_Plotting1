#reading data
data <- read.table("household_power_consumption.txt",sep=";", na.strings="?",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
#reformat date and time column to date-time column "Mydate"
data <- mutate(data,Mydate=strptime(paste(Date,Time),format="%m/%d/%Y %H:%M:%S")) %>% filter(Mydate >= "2007-02-01" & Mydate <="2007-02-03")

#Plot histogram
png(filename="plot2.png",width = 480, height = 480, units = "px")
plot(data$Mydate,data$Global_active_power,type="l", xlab ="", ylab="Global Active Power (kilowatts)")
dev.off()
