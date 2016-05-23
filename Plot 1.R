## Getting full dataset for the Week 1 Project 
ls()
rm(list = ls())
getwd()
setwd("/Users/Yingchun/Desktop/Week 1 Data Explore")
data_all <- read.csv("household_power_consumption-2.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
head(data_all)
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")
head(data_all)
## Subsetting the data
data <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
head(data)

## Plot 1
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480, bg ="white")
dev.off()
