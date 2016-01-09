file <- "./exdata-data-household_power_consumption/household_power_consumption.txt"
#reading the file
householddata <- read.delim(file,header=TRUE,sep=";",dec=".",stringsAsFactors = FALSE)
#only read the data subset to plot
workdata <- householddata[householddata$Date %in% c("1/2/2007","2/2/2007") ,]
# to append date and time and convert it to the required format
datetime <- strptime(paste(workdata$Date, workdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(workdata$Global_active_power)
#plot
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()