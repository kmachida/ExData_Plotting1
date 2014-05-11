
idx <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
data <- read.table(file = "household_power_consumption.txt", 
                   head = FALSE,sep = ";", skip = idx[1] - 1,
                   nrows = length(idx))

colnames(data) <- c("Date","Time","Global_active_power",
                    "Global_reactive_power", "Voltage",
                    "Global_intensity","Sub_metering_1",
                    "Sub_metering_2","Sub_metering_3")


data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png("plot1.png", width = 800, height = 600)
x <- hist(data$Global_active_power,xlab = "Global Active Power (killowatts)",
          ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
