## This function creating plot2.png from Exploratory Data Analysis Course project 1

plot2 <- function() {
  # reead data
  mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  # convert first column in date type
  mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")
  # subset dataset
  mydata <- subset(mydata, Date == "2007-02-01"|Date == "2007-02-02")
  #set x as sum of 1 & 2 columns 
  x<-strptime(paste(as.character(mydata[,1]),mydata[,2]),format="%Y-%m-%d %H:%M:%S", tz="")
  #set y as 3 column converted to numeric format
  y<-as.numeric(levels(mydata[,3]))[mydata[,3]]
  #create png file
  png("plot2.png",  width = 480, height = 480, units = "px")
  #create plot
  plot(x, y, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  #save png file
  dev.off()
}