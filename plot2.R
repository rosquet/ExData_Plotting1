library(dplyr)
library(tidyverse)
library(lubridate)

setwd("~/R/JHU_Data_Science/Exploratory_Data_Analysis/Project_1")

HPCraw <- tibble(read_delim("household_power_consumption.txt", delim = ";"))
HPC = filter(HPCraw, (Date == "1/2/2007" | Date == "2/2/2007"))

# Plot 2

firstSeconds = lapply(HPC[1:1440,2], function(x){x+0})
firstGAP = HPC[1:1440,3]
firstHalfGAP = bind_cols(firstSeconds, firstGAP)
secondSeconds = lapply(HPC[1441:2880,2], function(x){x+86400})
secondGAP = HPC[1441:2880,3]
secondHalfGAP = bind_cols(secondSeconds, secondGAP)
completeXYGAP = bind_rows(firstHalfGAP, secondHalfGAP)
plot(completeXYGAP, type="l", xaxt="n", ylab="Global Active Power (kilowats)", xlab="")
axis(1, at=seq(0,172740, by=86370), labels=c("Thu", "Fri", "Sat"))