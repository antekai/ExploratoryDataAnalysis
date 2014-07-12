## Getting data (reading the txt file data as powerDF, 
## note for R:  T==TRUE,F==FALSE)
powerDF <- read.table( "c:/household_power_consumption.txt", header = T, sep = ";", 
                       na.strings = "?", stringsAsFactors = F, 
                       colClasses = c("character","character","numeric","numeric", 
                                      "numeric","numeric","numeric","numeric","numeric"))

## creating the DateTime variable
powerDF$DateTime <- strptime(paste(powerDF$Date, powerDF$Time), format="%d/%m/%Y %H:%M:%S")

## Cleaning Data (subsetting on required dates)
powerDF$Date <- as.Date(powerDF$Date, format="%d/%m/%Y")
power2plot <- subset(powerDF, powerDF$Date == "2007-02-01" | powerDF$Date == "2007-02-02")

## Exploratory Data Analysis (creating the plot)
par(bg=NA)  ##setting transparent background (same as example plots)
plot(power2plot$DateTime, power2plot$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
lines(power2plot$DateTime, power2plot$Sub_metering_2, type = "l", col = "red")
lines(power2plot$DateTime, power2plot$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"),
        legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
		lty = 1,pt.cex = 1, cex = 1
	  )

## saving the plot as .png file & configuring dimensions (same as example plots)
dev.copy(png, "plot3.png", units="px", width = 504, height = 504)
dev.off()