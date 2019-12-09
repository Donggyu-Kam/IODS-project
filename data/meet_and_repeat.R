#Donggyu Kam, 08.12.2019

#Read table
bprs<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep="", header=T)
str(bprs)
summary(bprs)
head(bprs,3)

rats<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep="\t",header=TRUE)
str(rats)
summary(rats)

#Conversion the categorial variables to factors
bprs$treatment<-as.factor(bprs$treatment)
bprs$subject<-as.factor(bprs$subject)
str(bprs)
head(bprs)

rats$ID<-as.factor(rats$ID)
rats$Group<-as.factor(rats$Group)
str(rats)

#Convert the datasets to long form
library(dplyr)
library(tidyr)
bprs<-bprs%>%gather(key=week, value=bprs_score, -treatment, -subject)
bprs
str(bprs)
rats<-rats%>%gather(key=time, value=gram, -Group, -ID)
rats
str(rats)


setwd("Z:\\IODS-project\\data")

write.csv(rats,file="rats.csv",row.names = FALSE)
write.csv(bprs,file="bprs.csv",row.names = FALSE)
