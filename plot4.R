library(dplyr)
library(tidyverse)
library(lubridate)

setwd("~/R/JHU_Data_Science/Exploratory_Data_Analysis/Project_1")

HPCraw <- tibble(read_delim("household_power_consumption.txt", delim = ";"))
HPC = filter(HPCraw, (Date == "1/2/2007" | Date == "2/2/2007"))

# Plot 4

par(mfcol=c(2,2))

plot(completeXYGAP, type="l", xaxt="n", ylab="Global Active Power (kilowats)", xlab="")
axis(1, at=seq(0,172740, by=86370), labels=c("Thu", "Fri", "Sat"))

plot(completeXYsubM1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
axis(1, at=seq(0,172740, by=86370), labels=c("Thu", "Fri", "Sat"))
lines(completeXYsubM2, col="red")
lines(completeXYsubM3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)

plot(completeXYvol, type="l", xaxt="n", ylab="Voltage", xlab="daytime")
axis(1, at=seq(0,172740, by=86370), labels=c("Thu", "Fri", "Sat"))

plot(completeXYGRP, type="l", xaxt="n", ylab="Global_reactive_power", xlab="daytime")
axis(1, at=seq(0,172740, by=86370), labels=c("Thu", "Fri", "Sat"))