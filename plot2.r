setwd("F:\\Data Science\\My Codes and Assignments\\Coursera\\Exploratory Data Analysis\\Data")
data <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE,sep = ";",header = TRUE)

#Select only the two dates
exploratoryData <- subset(data,Date=="2/2/2007"|data$Date=="1/2/2007")
exploratoryData$Date = as.Date(exploratoryData$Date,"%d/%m/%Y")

#Derive a new column as timestamp
exploratoryData<-within(exploratoryData, { timestamp=format(as.POSIXct(paste(Date, Time)), "%Y-%m-%d %H:%M:%S")})
exploratoryData$timestamp <- as.Date(exploratoryData$timestamp,"%Y-%m-%d %H:%M:%S")

#Convert Global active power to numeric
exploratoryData$Global_active_power = as.numeric(exploratoryData$Global_active_power)

plot(exploratoryData$timestamp,exploratoryData$Global_active_power,pch=NA,xlab = "Time",ylab = "Global Active Power")
#pch = na ensures no symbols
lines(exploratoryData$timestamp,exploratoryData$Global_active_power)

dev.copy(png, file = "plot2.png") 
dev.off() 


