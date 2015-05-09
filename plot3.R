## This function creating plot3.png from Exploratory Data Analysis Course project 1

plot3 <- function() {
  #read data
  mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  #convert first column in date type
  mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")
  #subset dataset
  mydata <- subset(mydata, Date == "2007-02-01"|Date == "2007-02-02")
  #set x as sum of 1 & 2 columns 
  x<-strptime(paste(as.character(mydata[,1]),mydata[,2]),format="%Y-%m-%d %H:%M:%S", tz="")
  #set data for plots
  a<-as.numeric(levels(mydata[,7]))[mydata[,7]]
  b<-as.numeric(levels(mydata[,8]))[mydata[,8]]
  c<-as.numeric(mydata[,9])
  #create png file
  png("plot3.png",  width = 480, height = 480, units = "px")
  #create plot of sub metering 1
  plot(x, a, type="l", xlab="", ylab="Energy sub metering", ylim=range(c(a, b, c)))
  #create plot of sub metering 2
  par(new = T)
  plot(x, b, type="l", xlab="", ylab="", ylim=range(c(a, b, c)), col="red", axes= F)
  #create plot of sub metering 3
  par(new = T)
  plot(x, c, type="l", xlab="", ylab="", ylim=range(c(a, b, c)), col="blue", axes= F)
  # add legend to plot
  legend("topright",lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  #save png file 
  dev.off()
}