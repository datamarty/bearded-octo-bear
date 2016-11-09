# Coursera, John Hopkins University, Getting and cleaning data
# Week 1, quiz
#**     Martin Selway       **#
#**     Nov 2016            **#
###############################
# Set the correct WD
setwd("C:/Users/mselway/Documents/RCode/Coursera/GettingAndCleaningData/Wk1")
# Read in the sample data file getdata%2Fdata%2Fss06hid.csv
Housing2006 <- read.table("getdata%2Fdata%2Fss06hid.csv", header = T, sep = ",")
library(plyr)
cdata <- ddply(Housing2006, c("VAL"), summarise,
               N    = sum(!is.na("VAL"))
               )
cdata

# Q3
install.packages("xlsx")
library(xlsx)
dat <-read.xlsx("getdata%2Fdata%2FDATA.gov_NGAP.xlsx", sheetIndex = 1,rowIndex = c(18:23), colIndex = c(7:15), header = T)
dat
sum(dat$Zip*dat$Ext,na.rm=T)

# Q4
library(XML)
xmldoc <- xmlTreeParse("getdata%2Fdata%2Frestaurants.xml", useInternalNodes = T)
rootNode <- xmlRoot(xmldoc)
xmlName(rootNode)
names(rootNode)
rootNode[[1]][[1]]

zipcode<-xpathSApply(rootNode,"//zipcode",xmlValue)

sum(zipcode=='21231')

# Q5
install.packages("data.table")
library(data.table)

DT <- fread("getdata%2Fdata%2Fss06pid.csv", header = T, sep = ",")
DT[, .N, by=VAL==24]
system.time(mean(DT$pwgtp15,by=DT$SEX))
system.time(rowMeans(DT)[DT$SEX==1]); rowMeans(DT)[DT$SEX==2])
system.time(sapply(split(DT$pwgtp15,DT$SEX),mean))
system.time(tapply(DT$pwgtp15,DT$SEX,mean))
system.time(DT[,mean(pwgtp15),by=SEX])
system.time(mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15))
