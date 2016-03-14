#####  1 Assingment: Exploratory Data Analysis Course
#### Construct a 4 multiple base plots from:
#### - the linear plot of 'Global_active_power' and 'joinDateTime' variables
#### - the linear plot of 'Voltage' and 'joinDateTime' variables
#### - the linear plot from 'Sub_metering_1', 'Sub_metering_2', 
####   'Sub_metering_3' against 'joinDateTime' variables
#### - the linear plot of 'Global_reactive_power' and 'joinDateTime' variables

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
png(file = "plot4.png", width = 480, height = 480, bg = "transparent")

# setting the plotting layout
par(mfrow = c(2,2))

with(selectDateData, {
    # plot the first graphic
    plot(Date, as.double(as.character(Global_active_power)), type = "l", 
         ylab = "Global Active Power (killowatts)", xlab = "")
    #plot the 2 ghaphic
    plot(Date, as.double(as.character(Voltage)), type = "l", 
         ylab = "Voltage", xlab = "datetime")
    #plot the 3 ghaphic
    # set a empty 'canvas' ploting area
    plot(Date, Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "n")
    # plotting the linear relation among 'Sub_metering_1' and 'Date' variables
    lines(Date, as.double(as.character(Sub_metering_1)))
    # plotting the linear relation among 'Sub_metering_2' and 'Date' variables
    lines(Date, as.double(as.character(Sub_metering_2)), col = "red")
    # plotting the linear relation among 'Sub_metering_3' and 'Date' variables
    lines(Date, as.double(as.character(Sub_metering_3)), col = "blue")
    # plotting the legend
    legend("topright", lty=c(1,1,1), lwd = 2, col=c("black","red","blue"), bty = "n", cex = 0.9,
                            legend=c(names(selectDateData)[7], names(selectDateData)[8], 
                                     names(selectDateData)[9]))
    #plot the 4 ghaphic
    plot(Date, as.double(as.character(Global_reactive_power)), type = "l", 
     ylab = names(selectDateData)[4], xlab = "datetime")
    })

# close the graphic device
dev.off()