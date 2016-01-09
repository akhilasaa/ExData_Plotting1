file <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
#reading the file
householddata <- read.delim(file,header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)
#only read the data subset to plot
workdata <- householddata[householddata$Date %in% c("1/2/2007","2/2/2007") ,]
# to append date and time and convert it to the required format
datetime <- strptime(paste(workdata$Date, workdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workdata$Global_active_power)
png("plot3.png", width=480, height=480)
plot(datetime,as.numeric(workdata$Sub_metering_1),type="l",ylab="Energy Submetering", xlab="")
lines(datetime,as.numeric(workdata$Sub_metering_2),type="l",col="red")
lines(datetime,as.numeric(workdata$Sub_metering_3),type="l",col="blue")
# this is to add legend
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2.5,
       col=c("black","red","blue"))
dev.off()