## This function creating plot3.png from Exploratory Data Analysis Course project 1

plot4 <- function() {
  #read data
  mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  #convert first column in date type
  mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")
  #subset dataset
  mydata <- subset(mydata, Date == "2007-02-01"|Date == "2007-02-02")
  #set x as sum of 1 & 2 columns 
  x<-strptime(paste(as.character(mydata[,1]),mydata[,2]),format="%Y-%m-%d %H:%M:%S", tz="")
  #Converting columns
  mydata[,3]<-as.numeric(levels(mydata[,3]))[mydata[,3]]
  mydata[,4]<-as.numeric(levels(mydata[,4]))[mydata[,4]]
  mydata[,5]<-as.numeric(levels(mydata[,5]))[mydata[,5]]
  mydata[,7]<-as.numeric(levels(mydata[,7]))[mydata[,7]]
  mydata[,8]<-as.numeric(levels(mydata[,8]))[mydata[,8]]
  mydata[,9]<-as.numeric(mydata[,9])
  #create png file
  png("plot4.png",  width = 480, height = 480, units = "px")
  par(mfcol = c(2,2))
  with ( mydata, {
    plot(x, mydata[ ,3], type="l", xlab="", ylab="Global Active Power")
    with ( mydata, {
      plot(x, mydata[ ,7], type="l", xlab="", ylab="Energy sub metering", ylim=range(c(mydata[ ,7], mydata[ ,8], mydata[ ,9])))
      #create plot of sub metering 2
      par(new = T)
      plot(x, mydata[ ,8], type="l", xlab="", ylab="", ylim=range(c(mydata[ ,7], mydata[ ,8], mydata[ ,9])), col="red", axes= F)
      #create plot of sub metering 3
      par(new = T)
      plot(x, mydata[ ,9], type="l", xlab="", ylab="", ylim=range(c(mydata[ ,7], mydata[ ,8], mydata[ ,9])), col="blue", axes= F)
      # add legend to plot
      legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    })
    plot(x, mydata[ ,5], type="l", xlab="datetime", ylab="Voltage")
    plot(x, mydata[ ,4], type="l", xlab="datetime", ylab="Global_reactive_power")
  })
   
  dev.off()
}