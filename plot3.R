#####  1 Assingment: Exploratory Data Analysis Course
#### Construct the scatterplot from  'Sub_metering_1', 'Sub_metering_1',
#### 'Sub_metering_3' variables
#### save it to a PNG file with a width of 480 pixels and a height of 480 pixels

# read the house hold power consumption data 
householdData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# select the specified dates '1/2/2007' and '2/2/2007'
selectDateData <- householdData[(householdData$Date == "1/2/2007" | householdData$Date == "2/2/2007"),]

#join the atributtes 'Date' and 'Time'
joinDateTime <- with(selectDateData, paste(Date, Time)) 

# transform the type atributte 'character' to as.POSIX
selectDateData$Date <- strptime(joinDateTime, "%d/%m/%Y %H:%M:%S", tz = "GMT")

# set the graphic device
png(file = "plot3.png", width = 480, height = 480, bg = "transparent")

#plot Global_active_power by the complete Date (i.e. "%d/%m/%Y %H:%M:%S")
# set a empty 'canvas' ploting area
with(selectDateData, plot(Date, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n"))
# plotting the linear relation among 'Sub_metering_1' and 'Date' variables
with(selectDateData, lines(Date, as.double(as.character(Sub_metering_1))))
# plotting the linear relation among 'Sub_metering_2' and 'Date' variables
with(selectDateData, lines(Date, as.double(as.character(Sub_metering_2)), col = "red"))
# plotting the linear relation among 'Sub_metering_3' and 'Date' variables
with(selectDateData, lines(Date, as.double(as.character(Sub_metering_3)), col = "blue"))
# plotting the final legend
with(selectDateData, legend("topright", lty=c(1,1,1), lwd = 2, col=c("black","red","blue"),
                            legend=c(names(selectDateData)[7], names(selectDateData)[8], 
                                     names(selectDateData)[9])))
# close the graphic device
dev.off()