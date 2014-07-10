# Load in the first 10 rows of the original file so as to see the structure.
# Note that we already know the seperator is ";" and that "?' is used for missing values
initial <- read.table("household_power_consumption.txt", nrows = 10, sep = ";", head = TRUE, stringsAsFactors = FALSE)

# get the class of each variable so the read.table function can load the entire file quicker
classes <- sapply(initial, class)

# read the entire data set in
rawdata <- read.table("household_power_consumption.txt", colClasses = classes, head = TRUE, sep = ";", na.string = "?")

# subset the data for the days of February 1st and 2nd of 2007
data <- subset(rawdata, rawdata$Date == "1/2/2007" | rawdata$Date == "2/2/2007")

# remove the original data set from memory
rawdata <- NULL

# write the subset to a seperate file for later use
#write.csv(data, file = "subdata.csv")

# concatenate the date and time together and then convert to Date and Time classes
data$Time <- paste(data$Date, data$Time, sep = " ")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- strptime(data$Time, "%d/%m/%Y %H:%M:%S")

#set up the plot device for 4 plots that will be filled row first
par(mfrow = c(2,2))

# generate the first plot, which is similar to the Global Active Plot
plot(data$Time, data$Global_active_power, xlab = "", ylab = "Global Active Power", main = "", type = "l")

# generate the second plot, which is a new plot of datetime vs. Voltage
plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")

# generate the third plot, which is the same as the Sub_metering plot, but with no outline around the legend
plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type = "n")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")

# add a legend in the uper right hand corner of the third plot and use lines instead of points (lwd vs. pch)
legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# generate the fourth and final plot, which is a new plot of datetime vs. Global_reactive_power
plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = "")

# confirm the plot(s) and then open a png file and re-plot to the file.
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

# generate 'empty' plot, then add lines for Sub Metering 1, 2, and 3

plot(data$Time, data[,3], xlab = "", ylab = "Global Active Power", main = "", type = "l")

plot(data$Time, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", main = "")

plot(data$Time, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", main = "", type = "n")
lines(data$Time, data$Sub_metering_1, col = "black")
lines(data$Time, data$Sub_metering_2, col = "red")
lines(data$Time, data$Sub_metering_3, col = "blue")

legend("topright", bty = "n", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(data$Time, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", main = "")
dev.off()