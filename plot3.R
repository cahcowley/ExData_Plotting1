# Import data
# Take note: stringsAsFactors will influence how to convert Global_active_power to numeric class

dat <- read.table("household_power_consumption.txt",sep=";",header = T,stringsAsFactors = FALSE,dec=".")
temp <- dat

meh <- temp[temp$Date %in% c("1/2/2007","2/2/2007"),]

rownames(meh) <- 1:nrow(meh)

View(meh)
class(meh$Date)
meh$Date<- as.Date(meh$Date,format = "%d/%m/%Y")
class(meh$Date)


# Plot 1
# Convert Global_active_power to numeric
class(meh$Global_active_power)

# if you set stringsAsFactors = TRUE (default) in read.table, class(meh$Global_active_power) = character 
# then convert to numeric by:

meh$Global_active_power <- as.numeric(meh$Global_active_power)

# if you set stringsAsFactors = TRUE (default) in read.table, class(meh$Global_active_power) = factor,
# then convert to numeric by:
# meh$Global_active_power <- as.numeric(levels(meh$Global_active_power))[meh$Global_active_power]#

#Confirm class of Global_active_power
class(meh$Global_active_power)

# Combine Date and Time and convert to POSIXct
meh$datetime <- as.POSIXct(paste(meh$Date,meh$Time))


# Plot 3
png("plot3.png",height = 480, width = 480)
plot(meh$datetime, meh$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(meh$datetime, meh$Sub_metering_2,col="red")
lines(meh$datetime, meh$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

dev.off()