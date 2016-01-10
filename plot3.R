##Reading data into R
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subsetting the data required according to dates given
datareq <- data[data["Date"] == c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datareq$Date, datareq$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Subsetting the data for plotting and converting it into numeric
GAP <- as.numeric(datareq$Global_active_power)
SM1 <- as.numeric(datareq$Sub_metering_1)
SM2 <- as.numeric(datareq$Sub_metering_2)
SM3 <- as.numeric(datareq$Sub_metering_3)
##creating a png and plotting
png("plot3.png", width=480, height=480)
plot(datetime, SM1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, SM2, type="l", col="red")
lines(datetime, SM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
dev.off()