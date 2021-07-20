## Read dataset and put into "data" variable
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

## Set Date format
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data$Time <- format(data$Time, format = "%H:%M:%S")

## Only select data from date 2007-02-01 to 2007-02-02
selected_data <- data[which(data$Date == "2007-02-01" | data$Date == "2007-02-02"),]

## Set new Date and Time variable
newDateTime <- paste(selected_data$Date, selected_data$Time)
newDateTime <- strptime(newDateTime, format = "%Y-%m-%d %H:%M:%S")

## Set Global_active_power variable to numeric 
selected_data$Global_active_power <- as.numeric(as.character(selected_data$Global_active_power))

## create png grphic device
png("plot2.png", width = 480, height = 480)

## plot
plot(newDateTime, selected_data$Global_active_power, type = "l",xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()