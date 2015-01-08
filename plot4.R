#setwd("~/Online Courses/JHU_Exploratory_Data_Analysis/Assignments/ExData_Plotting1")

dat = read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") #, colClasses = c(character, character, numeric, numeric, numeric, numeric, numeric, numeric, numeric))
dat$Date = as.character(dat$Date)
dat$Time = as.character(dat$Time)

mydat = subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
mydat$timestamp = strptime(paste(mydat$Date, mydat$Time),
                           format="%d/%m/%Y %H:%M:%S")
dat = NULL

# Plot 4: 2x2 array of plots
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))
plot(mydat$timestamp, mydat$Global_active_power,
     type = "l", xlab="", ylab="Global Active Power")
plot(mydat$timestamp, mydat$Voltage,
     type = "l", xlab="datetime", ylab="Voltage")
plot(mydat$timestamp, mydat$Sub_metering_1,
     type = "l", xlab="", ylab="Energy sub metering")
lines(mydat$timestamp, mydat$Sub_metering_2,
      col = "red")
lines(mydat$timestamp, mydat$Sub_metering_3,
      col = "blue")
legend("topright", lwd=1, xjust= 1, bty = "n",
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(mydat$timestamp, mydat$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()
