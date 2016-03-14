#####  1 Assingment: Exploratory Data Analysis Course
#### Construct the histogram from  'Global_active_power' variable
#### save it to a PNG file with a width of 480 pixels and a height of 480 pixels

# read the house hold power consumption data 
householdData <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

# select the specified dates '1/2/2007' and '2/2/2007'
selectDateData <- householdData[(householdData$Date == "1/2/2007" | householdData$Date == "2/2/2007"),]

# convert from factor to date format
selectDateData[,"Date"] <- as.Date(selectDateData$Date)

# set the graphic device
png(file = "plot1.png", width = 480, height = 480, bg = "transparent")

# plot the histogram
with(selectDateData, hist(as.double(as.character(Global_active_power)), col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (killowatts)"))

# close the graphic device
dev.off()