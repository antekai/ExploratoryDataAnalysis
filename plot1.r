#Getting data (reading the txt file as powerDF, 
#note for R:  T==TRUE,F==FALSE)
powerDF <- read.table( "c:/household_power_consumption.txt", header = T, sep = ";", 
                          na.strings = "?", stringsAsFactors = F, 
                          colClasses = c("character","character","numeric","numeric", 
                                         "numeric","numeric","numeric","numeric","numeric"))

##creating the DateTime variable
powerDF$DateTime <- strptime(paste(powerDF$Date, powerDF$Time), format="%d/%m/%Y %H:%M:%S")

##Cleaning Data (subsetting on required dates)
powerDF$Date <- as.Date(powerDF$Date, format="%d/%m/%Y")
power2plot <- subset(powerDF, powerDF$Date == "2007-02-01" | powerDF$Date == "2007-02-02")

##Exploratory Data Analysis (creating the histogram)
hist(power2plot$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

##saving histogram as .png file
dev.copy(png, "plot1.png", units="px", width = 480, height = 480)
dev.off()
