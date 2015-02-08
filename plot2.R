data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)  ## Reads initial .txt file as a data frame
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")  ## Converts the Date column from a character class to a date class
data$Global_active_power <- as.numeric(data$Global_active_power)  ##Converts the global active power column to a numeric class
data$Time <- as.POSIXct(paste(data$Date,data$Time), format = "%Y-%m-%d %H:%M:%S")  ##Converts the Time column to represent calendar dates and times

dat <- data[which(data[,"Date"] %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d"))),]  ## Subsets the original data frame to include only the two days we are interested in


plot(dat$Time, dat$Global_active_power, ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")  ## Creates the specified plot
dev.copy(png, file = "plot2.png")  ##Copies the plot to a PNG file
dev.off()  ##Closes the PNG device