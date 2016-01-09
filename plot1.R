# This program plots the histogram

file <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
#reading the file
householddata <- read.delim(file,header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)
#only read the data subset to plot
workdata <- householddata[householddata$Date %in% c("1/2/2007","2/2/2007") ,]
#To create a png file of width and height 480
png("plot1.png",width=480,height=480)
#To plot the active power
globalActivePower <- as.numeric(workdata$Global_active_power)

hist(globalActivePower, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
#close the device
dev.off()