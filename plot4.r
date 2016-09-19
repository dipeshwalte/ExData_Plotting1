data <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";",header = TRUE)

#Select only the two dates
exploratoryData <- subset(data,Date=="2/2/2007"|data$Date=="1/2/2007")
exploratoryData$Date = as.Date(exploratoryData$Date,"%d/%m/%Y")

#Derive a new column as timestamp
exploratoryData<-within(exploratoryData, { timestamp=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S")})
exploratoryData$timestamp <- as.Date(exploratoryData$timestamp,"%Y-%m-%d %H:%M:%S")

#Convert Global active power to numeric
exploratoryData$Global_active_power = as.numeric(exploratoryData$Global_active_power)

par(mfrow = c(2, 2))
#divide Graphics device into two rows and two columns
with(exploratoryData, {
  plot(exploratoryData$timestamp,exploratoryData$Global_active_power,pch=NA,xlab = "Time",ylab = "Global Active Power")
  lines(exploratoryData$timestamp,exploratoryData$Global_active_power)
  
  plot(exploratoryData$timestamp,exploratoryData$Voltage,pch=NA,xlab = "Time",ylab = "Voltage")
  lines(exploratoryData$timestamp,exploratoryData$Voltage)
  
  plot(exploratoryData$timestamp,exploratoryData$Sub_metering_1,pch=NA,ylab = "Sub Metering",xlab = "Time")
  lines(exploratoryData$timestamp,exploratoryData$Sub_metering_1,col="Black")
  lines(exploratoryData$timestamp,exploratoryData$Sub_metering_2,col="Red")
  lines(exploratoryData$timestamp,exploratoryData$Sub_metering_3,col="Blue")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty = c(1,1,1),col=c("Black","Red","Blue"),cex = 0.5,bty = "n")
  
  
  plot(exploratoryData$timestamp,exploratoryData$Global_reactive_power,pch=NA,xlab = "Time",ylab = "Global Reactive Power")
  lines(exploratoryData$timestamp,exploratoryData$Global_reactive_power)
})


dev.copy(png, file = "plot4.png") 
dev.off() 

