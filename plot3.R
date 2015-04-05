################
## prepare data
################

epc <- read.table("household_power_consumption.txt", sep =";", header=TRUE)
epc$Date <- as.Date(strptime(epc$Date, "%d/%m/%Y"))
fepc <- epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02",]
require(stringr)
fepc$Sub_metering_1<- as.numeric(str_replace(fepc$Sub_metering_1, "\\?", ""))
fepc$Sub_metering_2<- as.numeric(str_replace(fepc$Sub_metering_2, "\\?", ""))

################
## create plot
################

plot(fepc$Sub_metering_1, type="l", xaxt="n", xlab = "", 
            ylim=c(0,38), ylab = "Energy sub metering")
par(new=T)
plot(fepc$Sub_metering_2, type="l", xaxt="n", yaxt="n", 
            ylim=c(0,38), xlab = "", ylab = "", col="red")
par(new=T)
plot(fepc$Sub_metering_3, type="l", xaxt="n", yaxt="n", 
            ylim=c(0,38), xlab = "", ylab = "", col="blue")
legend("topright", colnames(fepc[7:9]), lty=c(1,1,1), 
            col=c("black","red", "blue"), text.width = 1000)
axis(1, at = c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
