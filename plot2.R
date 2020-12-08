# plot2.R
# creates plot2

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
# plot 2 Global Active Power in kw by time

png("~/plot2.png", width=480, height=480)
plot(x = df$timestamp,
     y= df$Global_active_power, 
     type="l",
     ylab = "Global Active Power (kilowatts)")
dev.off()
