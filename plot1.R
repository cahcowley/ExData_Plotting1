
library(lattice,ggplot2)
setwd("I:/Current/Group Internal Audit/Actuarial Team/Charl/Training/0_Coursera/Data Science Specialization/4_Exploratory Data Analysis/Week 1")

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

# Plot 1 Histogram of Global_active_power
png("plot1.png",height = 480,width = 480)
hist(meh$Global_active_power,xlab="Global Active Power (kilowatts)", ylab= "Frequency", main="Global Active Power",col="red")
dev.off()
# if you set axes = FALSE in hist above, you can set the axes with the following two lines:  
# axis(side=1,at=seq(0,8,by = 2))
# axis(side=2,at=seq(0,1200,by=200))

