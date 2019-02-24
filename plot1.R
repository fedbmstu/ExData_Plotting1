#set working directory
setwd("C:/User/Fed/R/coursera/ExplData/DZ1")
#load data 
el_dt <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
#head(el_dt)
#convert date
el_dt$Date <- as.Date(el_dt$Date, format="%d/%m/%Y")
#seletct data subset
el_dt <- subset(el_dt, Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
#remove not complete cases
el_dt <- el_dt[complete.cases(el_dt),]
#convert date and time
DateTime <- paste(el_dt$Date, el_dt$Time)
DateTime<- strptime(DateTime, format="%Y-%m-%d %H:%M:%S")
#draw plot1
hist(el_dt$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
