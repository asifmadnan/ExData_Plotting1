plot1 <- function(fileName, pngName, startDate, endDate)
{
    data <- read.csv( fileName, na.strings = "?", sep = ";")
    
    targetData <- data
    targetData[,1] <- as.Date(targetData[,1], "%d/%m/%Y")
    
    targetData <- targetData[targetData[,"Date"]  >= startDate,]
    targetData <- targetData[targetData[,"Date"]  <= endDate,]
    
    png(file = pngName)
    
    hist(targetData$Global_active_power, col = "red",
         xlab = "Global Active Power (kilowatts)", ylab = "Frequency",
         main = "Global Active Power")
    
    dev.off()
}

fileN <- "H:\\Data Science Courses\\[4]Exploratory Data Analysis\\Assignment1\\household_power_consumption.csv"
pngN <- "H:\\Data Science Courses\\[4]Exploratory Data Analysis\\Assignment1\\plot1.png"
startDate <- as.Date("01/02/2007", "%d/%m/%Y")
endDate <- as.Date("02/02/2007", "%d/%m/%Y")

plot1(fileN, pngN, startDate, endDate)
