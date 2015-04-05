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
hist(fepc$Global_active_power, main = "Global Active Power", xlab = 
                "Global Active Power (kilowatts)", col =  "red")


