plot3 <- function(fileName, pngName, startDate, endDate)
{
    data <- read.csv(fileName,  
                     na.strings = "?", sep = ";")
    
    
    targetData <- data
    
    targetData[,1] <- as.Date(targetData[,1], "%d/%m/%Y")
    
    targetData <- targetData[targetData[,"Date"]  >= startDate,]
    targetData <- targetData[targetData[,"Date"]  <= endDate,]
    
    
    times <- strptime(paste(paste(format(targetData[,1], "%d"), paste(format(targetData[,1], "%m"), format(targetData[,1], "%Y"), sep = "/"), sep ="/"), as.character(targetData[,2])), "%d/%m/%Y %H:%M:%S")
    
    png(pngName)
    
    plot(times, targetData$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
    lines(times, targetData$Sub_metering_1, col = "black")
    lines(times, targetData$Sub_metering_2, col = "red")
    lines(times, targetData$Sub_metering_3, col = "blue")
    legend("topright", col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
    
    
    dev.off()
}


fileN <- "H:\\Data Science Courses\\[4]Exploratory Data Analysis\\Assignment1\\household_power_consumption.csv"
pngN <- "H:\\Data Science Courses\\[4]Exploratory Data Analysis\\Assignment1\\plot3.png"
startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y")

plot3(fileN, pngN, startDate, endDate)
