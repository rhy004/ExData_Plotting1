powerDT <- read.csv("C:/Users/Rhyhtm/Desktop/exdata_data_household_power_consumption/household_power_consumption.txt", sep=";")

View(powerDT)

# Convert Global_active_power to numeric, ignoring errors
powerDT$Global_active_power <- as.numeric(as.character(powerDT$Global_active_power))

# Convert Global_active_power to numeric, ignoring errors
powerDT$Global_active_power <- as.numeric(as.character(powerDT$Global_active_power))

# Change Date Column to Date Type with error handling
powerDT$Date <- as.Date(powerDT$Date, format = "%d/%m/%Y")

# Check the structure of the data frame
str(powerDT)

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(powerDT$Date >= "2007-02-01") & (powerDT$Date <= "2007-02-02"), ]

# Save the plot as PNG
png("plot1.png", width = 480, height = 480)

# Plotting with improved axis labels
hist(powerDT$Global_active_power, main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

# Save the plot
dev.off()


