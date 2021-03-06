#setwd("~/Online Courses/JHU_Exploratory_Data_Analysis/Assignments/ExData_Plotting1")

dat = read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?") #, colClasses = c(character, character, numeric, numeric, numeric, numeric, numeric, numeric, numeric))
dat$Date = as.character(dat$Date)
dat$Time = as.character(dat$Time)

mydat = subset(dat, Date == "1/2/2007" | Date == "2/2/2007")
mydat$timestamp = strptime(paste(mydat$Date, mydat$Time),
                           format="%d/%m/%Y %H:%M:%S")
dat = NULL
par(mfrow = c(1,1))

# Plot 2: timeseries of global active power in kW
png(file = "plot2.png", width = 480, height = 480)
plot(mydat$timestamp,
     mydat$Global_active_power,
     type = "l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()
