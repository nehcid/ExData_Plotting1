# Read in dataset
powercom <- read.table("./household_power_consumption.txt",header=TRUE,sep=";")
# subset data
powersub <- powercom[powercom$Date == "1/2/2007" | powercom$Date == "2/2/2007",]
# plot and save
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(powersub$Global_active_power)), main ="Golobal Active Power", col="red",
     xlab = "Global Active Power(kilowatts)", ylab = "Frequency")
dev.off()