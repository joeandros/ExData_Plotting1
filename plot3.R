data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)  ## Reads initial .txt file as a data frame
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")  ## Converts the Date column from a character class to a date class
data$Global_active_power <- as.numeric(data$Global_active_power)  ##Converts the global active power column to a numeric class
data$Time <- as.POSIXct(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")  ##Converts the Time column to represent calendar dates and times


dat <- data[which(data[,"Date"] %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d"))),]  ## Subsets the original data frame to include only the two days we are interested in

par(mfrow = c(1,1), mar = c(4, 4, 4, 4))
with(dat, plot(dat$Time, dat$Sub_metering_1, na.strings = "?", ylab = "Energy sub metering", type = "l", xlab = ""))  ## Creates the specified plot
with(dat, lines(dat$Time, dat$Sub_metering_2, na.strings = "?", type = "l", col = "red"))
with(dat, lines(dat$Time, dat$Sub_metering_3, na.strings = "?", type = "l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.7)
dev.copy(png, file = "plot3.png")  ##Copies the plot to a PNG file
dev.off()  ##Closes the PNG device