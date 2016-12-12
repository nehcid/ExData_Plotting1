# Read in dataset
powercom <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")
# subset data
powersub <- powercom[powercom$Date == "1/2/2007" | powercom$Date == "2/2/2007",]
# convert date and time into POSIXlt object
Datetime <- strptime(paste(powersub$Date,powersub$Time), format = "%d/%m/%Y %H:%M:%S")
# plot and save
png("plot3.png", width=480, height=480)
plot(Datetime,as.numeric(as.character(powersub$Sub_metering_1)), type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering")
lines(Datetime,as.numeric(as.character(powersub$Sub_metering_2)), type = "l", col = "red")
lines(Datetime,as.numeric(as.character(powersub$Sub_metering_3)), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()