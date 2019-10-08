#Load the datafame
d <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subset to the two dates relevant for the research question
d <- d[d$Date %in% c("1/2/2007","2/2/2007"),]

#Convert time and date
DateTime <-strptime(paste(d$Date, d$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Add the new column to the dataframe
d <- cbind(DateTime, d)

#Plot1
gap <- as.numeric(d$Global_active_power)
hist(gap, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

# Save file and close device
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()