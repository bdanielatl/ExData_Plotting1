#plot1.R
#please set your working directory in R to the folder holding this file.
#please place data in the working directory
library (dplyr)
library (tidyr)
#plot3.R
#please set your working directory in R to the folder holding this file.

library (dplyr)


#load the data only if it's not already in memory
if(!exists("d")){
  d<-read.csv2("household_power_consumption.txt",na.strings = c("?"))
  d<-dplyr::tbl_df(d)
  d<-dplyr::filter(d,Date=="1/2/2007"|Date=="2/2/2007")
  d$StartDate=as.POSIXlt(paste(as.Date(d$Date,  format="%d/%m/%Y"), d$Time, sep=" "))
}

#plot the data
png(file="plot3.png",width=480,height=480)
with(d,plot(StartDate,Sub_metering_1,type="l",
            col="black",
            ylab="Energy sub metering",xlab="")
     )
with(d,points(StartDate,Sub_metering_2,type="l",col="red"))
with(d,points(StartDate,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=names(d)[7:9],lty = 1,col=c("black","red","blue"),cex = 1)

dev.off()

