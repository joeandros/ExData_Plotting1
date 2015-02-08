data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)  ##Reads initial .txt file as a data frame
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")   ##Converts the Date column from a character class to a date class
data$Global_active_power <- as.numeric(data$Global_active_power)  ##Converts the global active power column to a numeric class

dat <- data[which(data[,"Date"] %in% c(as.Date("2007-02-01", format = "%Y-%m-%d"), as.Date("2007-02-02", format = "%Y-%m-%d"))),]  ##Subsets the original data frame to include only the two days we are interested in


#par(mfrow = c(1,1), mar = c(4, 4, 4, 4))
hist(dat$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")  ##creates the specified histogram
dev.copy(png, file = "plot1.png")  ##Copies the histogram to a PNG file
dev.off()  ##Closes the PNG device