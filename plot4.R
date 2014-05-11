
idx <- grep('^[1-2]/2/2007', readLines('household_power_consumption.txt'))
data <- read.table(file = "household_power_consumption.txt", 
                  head = FALSE,sep = ";", skip = idx[1] - 1,
                  nrows = length(idx))

colnames(data) <- c("Date","Time","Global_active_power",
                    "Global_reactive_power", "Voltage",
                    "Global_intensity","Sub_metering_1",
                    "Sub_metering_2","Sub_metering_3")


data$datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2),mar = c(4,4,2,1),oma = c(0,0,0,0))
d4<- with(data,{
  plot(datetime, Global_active_power,type = "l",
       ylab = "Global Active Power (kilowatts)",
       xlab = "")
  plot(datetime,Voltage,type = "l")
  plot(datetime, Sub_metering_1,type = "l",
       ylab = "Energy sub metering",
       xlab = "",col = "black")
  lines(datetime,Sub_metering_2,col = "red")
  lines(datetime,Sub_metering_3,col = "blue")
  legend("topright",lty = 1,col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
         bty = "n")
  plot(datetime,Global_reactive_power,type = "l")
})
dev.off()