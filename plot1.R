#plot1.R
#please set your working directory in R to the folder holding this file.
#please place data in the working directory
#this is for ploting the global active power in a histogram

library (dplyr)
#load the data

if(!exists("d")){
  d<-read.csv2("household_power_consumption.txt",na.strings = c("?"),
               stringsAsFactors = FALSE)
  d<-dplyr::tbl_df(d)
  d<-dplyr::filter(d,Date=="1/2/2007"|Date=="2/2/2007")
  d<-mutate(d,StartDate=as.Date(Date,"%d/%m/%Y"))
}

#call hist to build the first plot
png(file="plot1.png",width=480,height=480)
hist(as.numeric(d$Global_active_power), #set the data
     col="red", #set the color
     main="Global Active Power", #set the title
     xlab="Global Active Power (kilowats)", #label the graph
     xaxt="n", #turn off the axis (which will beo configured later)
     xlim=c(0,6), #set the x-axis limit to 6
     ylim = c(0,1200) #set the y axis limit
     )
axis(side=1,at=seq(from = 0 ,to = 10 ,by = 2))
dev.off()
