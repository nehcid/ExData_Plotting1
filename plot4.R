# Read in dataset
powercom <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")
# subset data
powersub <- powercom[powercom$Date == "1/2/2007" | powercom$Date == "2/2/2007",]
# convert date and time into POSIXlt object
Datetime <- strptime(paste(powersub$Date,powersub$Time), format = "%d/%m/%Y %H:%M:%S")
# plot and save
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# first plot
plot(Datetime,as.numeric(as.character(powersub$Global_active_power)), type = "l", xlab = "", 
     ylab = "Global Active Power(kilowatts)")

# second plot
plot(Datetime,as.numeric(as.character(powersub$Voltage)), type = "l", xlab = "datetime", 
     ylab = "Voltage")

# third plot
plot(Datetime,as.numeric(as.character(powersub$Sub_metering_1)), type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering")
lines(Datetime,as.numeric(as.character(powersub$Sub_metering_2)), type = "l", col = "red")
lines(Datetime,as.numeric(as.character(powersub$Sub_metering_3)), type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8,
       lty=1, col=c("black", "red", "blue"))

# last plot
plot(Datetime,as.numeric(as.character(powersub$Global_reactive_power)), type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()