# plot1.R
# creates plot1

# read in data
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              temp)
df <- read.table(unz(temp, "household_power_consumption.txt"), 
                   header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")
unlink(temp)

# clean up and filter file
df <- subset(df, df$Date == "1/2/2007" | df$Date == "2/2/2007")


# create plot
# plot 1 is the frequency of Global Active Power in kw

png("~/plot1.png", width=480, height=480)
hist(x = df$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
