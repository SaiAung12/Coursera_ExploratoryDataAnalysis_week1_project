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

## Set Sub_metering variables to numeric 
selected_data$Sub_metering_1 <- as.numeric(as.character(selected_data$Sub_metering_1))
selected_data$Sub_metering_2 <- as.numeric(as.character(selected_data$Sub_metering_2))
selected_data$Sub_metering_3 <- as.numeric(as.character(selected_data$Sub_metering_3))

## create png grphic device
png("plot3.png", width = 480, height = 480)

## plot
plot(newDateTime, selected_data$Sub_metering_1, type = "l",xlab = "", ylab = "Energy sub metering")
lines(newDateTime, selected_data$Sub_metering_2, type = "l",xlab = "", col = "red")
lines(newDateTime, selected_data$Sub_metering_3, type = "l",xlab = "", col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

dev.off()
