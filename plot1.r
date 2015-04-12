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


#hist
hist(data2$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

dev.copy(png, file="plot1.png", height=480, width=480) 
dev.off() 
