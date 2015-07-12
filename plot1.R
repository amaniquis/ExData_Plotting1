data <- read.table("household_power_consumption.txt", header = T, sep = ";",
                   stringsAsFactors = F, na.strings = c("?"))
data <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

png("plot1.png", width = 480, height = 480, bg = "transparent")

with(data,
     hist(as.numeric(Global_active_power), col = "red", 
          xlab = "Global Active Power (kilowatts)",
          main = "Global Active Power")
     )

dev.off()