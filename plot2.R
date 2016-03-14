#####  1 Assingment: Exploratory Data Analysis Course
#### Construct the scatterplot of 'Global_active_power' and 'joinDateTime' variables
#### save it to a PNG file with a width of 480 pixels and a height of 480 pixels

# read the house hold power consumption data 
householdData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# select the specified dates '1/2/2007' and '2/2/2007'
selectDateData <- householdData[(householdData$Date == "1/2/2007" | householdData$Date == "2/2/2007"),]

#join the atributtes 'Date' and 'Time'
joinDateTime <- with(selectDateData, paste(Date, Time)) 

# transform the type atributte 'character' to 'as.POSIX'
selectDateData$Date <- strptime(joinDateTime, "%d/%m/%Y %H:%M:%S", tz = "GMT")

# set the graphic device
png(file = "plot2.png", width = 480, height = 480, bg = "transparent")

#plot Global_active_power by the complete Date (i.e. "%d/%m/%Y %H:%M:%S")
with(selectDateData, plot(Date, as.double(as.character(Global_active_power)), 
             type = "l", ylab = "Global Active Power (killowatts)", xlab = ""))

# close the graphic device
dev.off()