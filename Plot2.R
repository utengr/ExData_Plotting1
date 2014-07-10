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

# generate plot of Global Active Power vs. Time as a line plot and label the axis as appropriate
plot(data$Time, data[,3], xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type = "l")

# confirm the plot and then open a png file and re-plot the line plot to the file.
png(filename = "plot2.png", width = 480, height = 480)
plot(data$Time, data[,3], xlab = "", ylab = "Global Active Power (kilowatts)", main = "", type = "l")
dev.off()