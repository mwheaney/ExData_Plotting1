################
## prepare data
################

epc <- read.table("household_power_consumption.txt", sep =";", header=TRUE)
epc$Date <- as.Date(strptime(epc$Date, "%d/%m/%Y"))
fepc <- epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02",]
require(stringr)
fepc$Sub_metering_1<- as.numeric(str_replace(fepc$Sub_metering_1, "\\?", ""))
fepc$Sub_metering_2<- as.numeric(str_replace(fepc$Sub_metering_2, "\\?", ""))
fepc$Global_active_power<- as.numeric(str_replace(
                fepc$Global_active_power, "\\?", ""))
fepc$Global_reactive_power<- as.numeric(str_replace(
                fepc$Global_reactive_power, "\\?", ""))
fepc$Voltage<- as.numeric(str_replace(fepc$Voltage, "\\?", ""))

################
## create plots
################

par(mfrow=c(2,2), cex = 0.6)

##Plot1
plot(fepc$Global_active_power, type="l", xaxt="n", xlab = "", 
                 ylab = "Global Active Power")
axis(1, at = c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

##Plot2
plot(fepc$Voltage, type="l", xaxt="n", xlab = "datetime", 
                ylab = "Voltage")
axis(1, at = c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
##axis(2,  cex.axis=.8)

##Plot3
plot(fepc$Sub_metering_1, type="l", xaxt="n", xlab = "", 
                ylim=c(0,38), ylab = "Energy sub metering")
par(new=T)
plot(fepc$Sub_metering_2, type="l", xaxt="n", yaxt="n", 
                ylim=c(0,38), xlab = "", ylab = "", col="red")
par(new=T)
plot(fepc$Sub_metering_3, type="l", xaxt="n", yaxt="n", 
                ylim=c(0,38), xlab = "", ylab = "", col="blue")
legend("topright", colnames(fepc[7:9]), lty=c(1,1,1), bty = "n",
                col=c("black","red", "blue"), text.width = 1600)
axis(1, at = c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))

##Plot4
plot(fepc$Global_reactive_power, type="l", xaxt="n", xlab = "datetime", 
                yaxt="n", ylim=c(0,.5), ylab = "Global_reactive_power")
axis(1, at = c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))
axis(2, at = c(0.0 ,0.1 ,0.2, 0.3, 0.4, 0.5))
