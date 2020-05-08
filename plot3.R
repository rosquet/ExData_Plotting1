library(dplyr)
library(tidyverse)
library(lubridate)

setwd("~/R/JHU_Data_Science/Exploratory_Data_Analysis/Project_1")

HPCraw <- tibble(read_delim("household_power_consumption.txt", delim = ";"))
HPC = filter(HPCraw, (Date == "1/2/2007" | Date == "2/2/2007"))

# Plot 3

firstHalfsubM1 = bind_cols(firstSeconds, HPC[1:1440,7])
secondHalfsubM1 = bind_cols(secondSeconds, HPC[1441:2880,7])
completeXYsubM1 = bind_rows(firstHalfsubM1, secondHalfsubM1)
firstHalfsubM2 = bind_cols(firstSeconds, HPC[1:1440,8])
secondHalfsubM2 = bind_cols(secondSeconds, HPC[1441:2880,8])
completeXYsubM2 = bind_rows(firstHalfsubM2, secondHalfsubM2)
firstHalfsubM3 = bind_cols(firstSeconds, HPC[1:1440,9])
secondHalfsubM3 = bind_cols(secondSeconds, HPC[1441:2880,9])
completeXYsubM3 = bind_rows(firstHalfsubM3, secondHalfsubM3)
firstHalfvol = bind_cols(firstSeconds, HPC[1:1440,5])
secondHalfvol = bind_cols(secondSeconds, HPC[1441:2880,5])
completeXYvol = bind_rows(firstHalfvol, secondHalfvol)
firstHalfGRP = bind_cols(firstSeconds, HPC[1:1440,4])
secondHalfGRP = bind_cols(secondSeconds, HPC[1441:2880,4])
completeXYGRP = bind_rows(firstHalfGRP, secondHalfGRP)

plot(completeXYsubM1, type="l", xlab="", ylab="Energy sub metering", xaxt="n")
axis(1, at=seq(0,172740, by=86370), labels=c("Thu", "Fri", "Sat"))
lines(completeXYsubM2, col="red")
lines(completeXYsubM3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.8)