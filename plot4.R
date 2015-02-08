data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)  ## Reads initial .txt file as a data frame
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")  ## Converts the Date column from a character class to a date class
data$Global_active_power <- as.numeric(data$Global_active_power)  ##Converts the global active power column to a numeric class
data$Time <- as.POSIXct(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")  ##Converts the Time column to represent calendar dates and times
data$Voltage <- as.numeric(data$Voltage) ## Converts Voltage column to a numeric
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)  ## Converts Global_reactive_power column toa  numeric


dat <- data[which(data[,"Date"] %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d"))),]  ## Subsets the original data frame to include only the two days we are interested in


par(mfrow = c(2,2)) #sets up the output plot to display the four smaller plots 2x2
with (dat, {
        plot(dat$Time, dat$Global_active_power, ylab = "Global Active Power", type = "l", xlab = "")
        plot(dat$Time, dat$Voltage, ylab = "Voltage", xlab = "datetime", type = "l")
        with(dat, plot(dat$Time, dat$Sub_metering_1, na.strings = "?", ylab = "Energy sub metering", type = "l", xlab = ""))
        with(dat, lines(dat$Time, dat$Sub_metering_2, na.strings = "?", type = "l", col = "red"))
        with(dat, lines(dat$Time, dat$Sub_metering_3, na.strings = "?", type = "l", col = "blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex = 0.3, y.intersp = 0.7)
        plot(dat$Time, dat$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
        dev.copy(png, file = "plot4.png")  ##Copies the plots to a PNG file
})
dev.off()  ##Closes the PNG device