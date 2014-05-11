
idx <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
data <- read.table(file = "household_power_consumption.txt", 
                   head = FALSE,sep = ";", skip = idx[1] - 1,
                   nrows = length(idx))

colnames(data) <- c("Date","Time","Global_active_power",
                    "Global_reactive_power", "Voltage",
                    "Global_intensity","Sub_metering_1",
                    "Sub_metering_2","Sub_metering_3")


data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480)
y <- with(data,plot(datetime, Global_active_power,type = "l",
                    ylab = "Global Active Power (kilowatts)",
                    xlab = ""))
dev.off()

