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
png(filename = "plot4.png", width = 480, height = 480,units = "px") 
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(data2$Global_active_power~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
plot(data2$Voltage~data2$Datetime, type="l",   ylab="Voltage (volt)", xlab="") 
plot(data2$Sub_metering_1~data2$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="") 
lines(data2$Sub_metering_2~data2$Datetime,col='Red') 
lines(data2$Sub_metering_3~data2$Datetime,col='Blue') 
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n", 
 legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
plot(data2$Global_reactive_power~data2$Datetime, type="l",ylab="Global Rective Power (kilowatts)",xlab="") 
dev.off()

