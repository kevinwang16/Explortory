#set direction
getwd()
setwd("C:/Users/Xi/Documents/Explortory data analysis")

#get data
data1 <- read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"') 
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
dim(data1)
attach(data1)
head(data1)
subset <- Date == "2007-02-01" | Date == "2007-2-2"
data2<-data1[subset,]
head(data2)

datetime <- paste(as.Date(data2$Date), data2$Time) 
data2$Datetime <- as.POSIXct(datetime) 



#plot
png(filename = "plot3.png", width = 480, height = 480,units = "px") 
plot(data2$Datetime,data2$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="") 
lines(data2$Datetime,data2$Sub_metering_2, type="l", col = "red") 
lines(data2$Datetime,data2$Sub_metering_3, type="l", col = "blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 
dev.off()
