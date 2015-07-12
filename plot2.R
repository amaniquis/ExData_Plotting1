data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   stringsAsFactors = F, na.strings = c("?"))
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

datetime <- strptime(paste(data$Date, data$Time, sep = " "),
                     "%d/%m/%Y %H:%M:%S")
data <- cbind(data, datetime)

png("plot2.png", width = 480, height = 480)

with(data,
     plot(datetime, Global_active_power, xlab = "",
          ylab = "Global Active Power (kilowatts)", type = "l")
     )

dev.off()