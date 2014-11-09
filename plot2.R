c4q1=read.table("household_power_consumption.txt",sep=";",header=TRUE,nrows=7)
class_col<-sapply(c4q1,class)
c4q1<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=class_col,na.strings="?")
c4q1$Date<-as.Date(c4q1$Date,format="%d/%m/%Y")
c4q1m<-c4q1[c4q1$Date %in% as.Date(c('2007-02-01','2007-02-02')),]
c4q1m$Datetime<-as.POSIXct(paste(c4q1m$Date,c4q1m$Time),format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png",width=480,height=480)
plot(c4q1m$Datetime,c4q1m$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="",main="")
dev.off()
