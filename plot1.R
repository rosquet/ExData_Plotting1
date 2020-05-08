library(dplyr)
library(tidyverse)
library(lubridate)

setwd("~/R/JHU_Data_Science/Exploratory_Data_Analysis/Project_1")

HPCraw <- tibble(read_delim("household_power_consumption.txt", delim = ";"))
HPC = filter(HPCraw, (Date == "1/2/2007" | Date == "2/2/2007"))

# Plot 1

hist(HPC$Global_active_power, col="red", xlab="Global Active Power (kilowats)", 
     main="Global Active Power")
