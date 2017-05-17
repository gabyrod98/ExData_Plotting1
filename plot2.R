#loading data

data_exam <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?") 
date_time <- paste(data_exam$Date,data_exam$Time)
date_time <- strptime(date_time,"%d/%m/%Y %H:%M:%S")
data_examf <- cbind(date_time,data_exam)
data_examf$Date <-as.Date(data_examf$Date, format = "%d/%m/%Y")


#Subseting data
minidata1 <- subset(data_examf, data_examf$Date >= "2007-02-01")
minidataf <- subset(minidata1, minidata1$Date <= "2007-02-02")

#plot 2
png("plot2.png", width = 480, height = 480, units = "px")
plot(minidataf$date_time, minidataf$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()
