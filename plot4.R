#Load the datafame
d <- read.table("household_power_consumption.txt", header=T, sep=";")

#Subset to the two dates relevant for the research question
d <- d[d$Date %in% c("1/2/2007","2/2/2007"),]

#Convert time and date
DateTime <-strptime(paste(d$Date, d$Time, sep=" "),"%d/%m/%Y %H:%M:%S")

#Add the new column to the dataframe
d <- cbind(DateTime, d)

#Plot4
par(mfrow=c(2,2))
plot(d$DateTime, d$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(d$DateTime, d$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(d$DateTime, d$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(d$DateTime, d$Sub_metering_2, col="red", type="l")
lines(d$DateTime, d$Sub_metering_3, col="blue", type="l")
plot(d$DateTime, d$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Safe and close
dev.copy(png,"plot3.png", width=480, height=480)
dev.off()