#Load the datafame
d <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subset to the two dates relevant for the research question
d <- d[d$Date %in% c("1/2/2007","2/2/2007"),]

#Convert time and date
DateTime <-strptime(paste(d$Date, d$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Add the new column to the dataframe
d <- cbind(DateTime, d)

#Plot3

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(d$DateTime, d$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(d$DateTime, d$Sub_metering_2, col=columnlines[2])
lines(d$DateTime, d$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid", cex=0.75)

#Safe and close
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()