#plot4.R
#please set your working directory in R to the folder holding this file.
#also please place the data in the working directory
#this plot is for multiple plots in the same graphic

library (dplyr)

#load the data only if it's not already in memory
if(!exists("d")){
  d<-read.csv2("household_power_consumption.txt",na.strings = c("?"))
  d<-dplyr::tbl_df(d)
  d<-dplyr::filter(d,Date=="1/2/2007"|Date=="2/2/2007")
  d$StartDate=as.POSIXlt(paste(as.Date(d$Date,  format="%d/%m/%Y"), d$Time, sep=" "))
}

#set the par settings such that multiple plots will reside on the same graph

par(mfrow=c(2,2),mar=c(4,4,2,1))

#plot the data


with(d,
     {
       #plot the first graph
       plot(d$StartDate,
            d$Global_active_power,
            type="l",
            ylab="Global Active Power",
            xlab="")
       
       #plot the second graph
       plot(d$StartDate,
            d$Voltage,
            type="l",
            ylab="Voltage",
            xlab="datetime")
       
       #plot the third graph
       plot(StartDate,Sub_metering_1,type="l",
            col="black",
            ylab="Energy sub metering",xlab="")
     
        with(d,points(StartDate,Sub_metering_2,type="l",col="red"))
        with(d,points(StartDate,Sub_metering_3,type="l",col="blue"))
        legend("topright",legend=names(d)[7:9],lty = 1,col=c("black","red","blue")
               ,cex = .7, bty="n",inset=c(0.05,0))
        
      #plot the fourth graph
        plot(d$StartDate,
             d$Global_reactive_power,
             type="l",
             ylab="Global_reactive_power",
             xlab="datetime")
        
     }
)
#export the graph
dev.copy(png,file="plot4.png")
dev.off()
#reset the default graphics options
.pardefault <- par()
par(.pardefault)
