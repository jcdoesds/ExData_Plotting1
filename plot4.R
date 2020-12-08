# plot3.R
# creates plot3

# read in data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
unlink(temp)

# clean up and filter file
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")
df$timestamp <- strptime(paste(df$Date, df$Time), "%d/%m/%Y %H:%M:%S")

# create plot
# plot 4 is a multiplot
# orig plot 2, voltage by timestamp, orig plot 3, global reactive power by timestamp

png("~/plot4.png", width=480, height=480)

par(mfrow = c(2, 2))

## plot 1 top left
plot(x = df$timestamp,
     y = df$Global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power")

## plot 2 top right
plot(x = df$timestamp,
     y = df$Voltage, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Voltage")

## plot 3 lower left
plot(x = df$timestamp,
     y= df$Sub_metering_1, 
     type="l",
     ylab = "Energy sub metering",
     xlab =)
lines(x = df$timestamp,
      y = df$Sub_metering_2,
      col = "red")
lines(x = df$timestamp,
      y = df$Sub_metering_3,
      col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), pch = "-")

## plot 4 lower right
plot(x = df$timestamp,
     y = df$Global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")

par(mfrow = c(1, 1))  # always do this to put it back

dev.off()
