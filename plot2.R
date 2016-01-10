##Reading data into R
data <- read.table("./data/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subsetting the data required according to dates given
datareq <- data[data["Date"] == c("1/2/2007","2/2/2007") ,]

datetime <- strptime(paste(datareq$Date, datareq$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##Subsetting the data for plotting and converting it into numeric
GAP <- as.numeric(datareq$Global_active_power)
##making a png and plotting
png("plot2.png", width=480, height=480)
plot(datetime, GAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()