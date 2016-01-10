##Reading data into R
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subsetting the data required according to dates given
datareq <- data[data["Date"] == c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datareq$Date, datareq$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Subsetting the data for plotting and converting it into numeric
GAP <- as.numeric(datareq$Global_active_power)
GRP <- as.numeric(datareq$Global_reactive_power)
SM1 <- as.numeric(datareq$Sub_metering_1)
SM2 <- as.numeric(datareq$Sub_metering_2)
SM3 <- as.numeric(datareq$Sub_metering_3)
voltage <- as.numeric(datareq$Voltage)
##creating a png and plotting the required graphs
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, GRP, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()