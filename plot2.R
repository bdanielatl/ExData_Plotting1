#plot2.R
#please set your working directory in R to the folder holding this file.
#this file is for plotting the global active power over time

library (dplyr)

#load the data only if it's not already in memory
if(!exists("d")){
  d<-read.csv2("household_power_consumption.txt",na.strings = c("?"))
  d<-dplyr::tbl_df(d)
  d<-dplyr::filter(d,Date=="1/2/2007"|Date=="2/2/2007")
  d$StartDate=as.POSIXlt(paste(as.Date(d$Date,  format="%d/%m/%Y"), d$Time, sep=" "))
}

#plot the data
png(file="plot2.png",width=480,height=480)
plot(d$StartDate,
     d$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()

