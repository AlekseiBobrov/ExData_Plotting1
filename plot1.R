## This function creating plot1.png from Exploratory Data Analysis Course project 1

plot1 <- function() {
  # read data
  mydata <- read.table("household_power_consumption.txt", sep=";", header=TRUE)
  # convert first column in date type
  mydata[,1] <- as.Date(mydata[,1], "%d/%m/%Y")
  # subset dataset
  mydata <- subset(mydata, Date == "2007-02-01"|Date == "2007-02-02")
  # set x as converted Global_active_power to  numeric format
  x<-as.numeric(levels(mydata[,3]))[mydata[,3]]
  #Create png file 
  png("plot1.png",  width = 480, height = 480, units = "px")
  #create plot
  hist(x, col="red", main="Global Active Power", xlab==="Global Active Power (kilowatts)", ylim=c(0,1200), breaks=12)
  #save png file
  dev.off()
}
