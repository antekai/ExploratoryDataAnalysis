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
plot(power2plot$DateTime, power2plot$Global_active_power, type = "l", ylab = 
       "Global Active Power (kilowatts)", xlab = "")

## saving the plot as .png file & configuring dimensions (same as example plots)
dev.copy(png, "plot2.png", units="px", width = 504, height = 504)
dev.off()