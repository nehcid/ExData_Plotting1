# Read in dataset
powercom <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")
# subset data
powersub <- powercom[powercom$Date == "1/2/2007" | powercom$Date == "2/2/2007",]
# convert date and time into POSIXlt object
Datetime <- strptime(paste(powersub$Date,powersub$Time), format = "%d/%m/%Y %H:%M:%S")
# plot and save
png("plot2.png", width=480, height=480)
plot(Datetime,as.numeric(as.character(powersub$Global_active_power)), type = "l", xlab = "", 
     ylab = "Global Active Power(kilowatts)")
dev.off()
