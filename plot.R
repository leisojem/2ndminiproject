##################### Problem 2 ####################

files <- file("/Users/Lian Marie Mejos/Desktop/specdata_plot/household_power_consumption.txt")  

data_powerconsumption<- read.table(text = grep("^[1,2]/2/2007",readLines(files),value=T), sep = ';', col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = '?')  


###Plot 1 

#Making a PNG of Plot 1
png(filename = "./plot1.png", width = 480, height = 480, units="px")  

#Plot 1 figure
with(data_powerconsumption, hist(Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red"))  

#Closing the  device
dev.off()  


###Plot 2

#Converting date and time to a specific format
data_powerconsumption$Date <- as.Date(data_powerconsumption$Date, format = "%d/%m/%Y")  
data_powerconsumption$DateTime <- as.POSIXct(paste(data_powerconsumption$Date,data_powerconsumption$Time))  

#Making a PNG of Plot 2
png(filename = "./plot2.png", width = 480, height = 480, units="px")  

#Plot 2 figure
Sys.setlocale(category = "LC_ALL", locale = "English")  
plot(data_powerconsumption$DateTime,data_powerconsumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")  

#Closing the device
dev.off()  


###Plot 3

#Making a PNG of Plot 3
png(filename = "./plot3.png", width = 480, height = 480, units="px")  

#Plot 3 figure
Sys.setlocale(category = "LC_ALL", locale = "English")  
plot(data_powerconsumption$DateTime, data_powerconsumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")  
lines(data_powerconsumption$DateTime, data_powerconsumption$Sub_metering_2, col = "red")  
lines(data_powerconsumption$DateTime, data_powerconsumption$Sub_metering_3, col = "blue")  
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)  

#Closing the device
dev.off()  


###Plot 4

#Making a PNG of Plot 4
png(filename = "./plot4.png", width = 480, height = 480, units="px")  

#Plot 4 figure
Sys.setlocale(category = "LC_ALL", locale = "English")  
par(mfrow = c(2, 2))  
plot(data_powerconsumption$DateTime, data_powerconsumption$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")  
plot(data_powerconsumption$DateTime, data_powerconsumption$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")  
plot(data_powerconsumption$DateTime, data_powerconsumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")  
lines(data_powerconsumption$DateTime, data_powerconsumption$Sub_metering_2, col = "red")  
lines(data_powerconsumption$DateTime, data_powerconsumption$Sub_metering_3, col = "blue")  
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)  
plot(data_powerconsumption$DateTime, data_powerconsumption$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")  

#Closing the device
dev.off()  