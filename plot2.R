################
## prepare data
################

epc <- read.table("household_power_consumption.txt", sep =";", header=TRUE)
epc$Date <- as.Date(strptime(epc$Date, "%d/%m/%Y"))
fepc <- epc[epc$Date >= "2007-02-01" & epc$Date <= "2007-02-02",]
require(stringr)
fepc$Global_active_power<- as.numeric(str_replace(
                    fepc$Global_active_power, "\\?", ""))

################
## create plot
################

plot(fepc$Global_active_power, type="l", xaxt="n", xlab = "", 
                    ylab = "Global Active Power (kilowatts)")
axis(1, at = c(0,1440,2880), labels=c("Thu", "Fri", "Sat"))