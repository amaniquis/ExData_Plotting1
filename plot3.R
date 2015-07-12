data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   stringsAsFactors = F, na.strings = c("?"))
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(data$Date, data$Time, sep = " "),
                     "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

png("plot3.png", width = 480, height = 480)

with(data,
     plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy sub metering",
          type = "n")
    )
with(data, points(datetime, Sub_metering_1, type = "l", col = "black"))
with(data, points(datetime, Sub_metering_2, type = "l", col = "red"))
with(data, points(datetime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1)

dev.off()