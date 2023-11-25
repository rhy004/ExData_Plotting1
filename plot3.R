powerDT <- read.csv("C:/Users/Rhyhtm/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

View(powerDT)

# Prevents Scientific Notation
powerDT$Global_active_power <- as.numeric(powerDT$Global_active_power)

# Making a POSIXct date capable of being filtered and graphed by time of day
powerDT$dateTime <- as.POSIXct(paste(powerDT$Date, powerDT$Time), format = "%d/%m/%Y %H:%M:%S")

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(powerDT$dateTime >= "2007-02-01") & (powerDT$dateTime < "2007-02-03"), ]

png("plot3.png", width=480, height=480)

# Plot 3
plot(powerDT$dateTime, powerDT$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerDT$dateTime, powerDT$Sub_metering_2, col="red")
lines(powerDT$dateTime, powerDT$Sub_metering_3, col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
