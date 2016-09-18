
# Show message because loading data may take a while
message("Loading data... ", appendLF = F)

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# Show loading done message
message("Done\n")

subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Show message for creating plot
message("Creating plot... ", appendLF = F)

datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

# Show done message for plot
message("Done\n")
