#Donggyu Kam, 08.12.2019

#Read table
BPRS<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep="", header=T)
str(BPRS)
summary(BPRS)

RATS<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep="\t",header=TRUE)
str(RATS)
summary(RATS)

#Conversion the categorial variables to factors
BPRS$treatment<-factor(BPRS$treatment)
BPRS$subject<-factor(BPRS$subject)
str(BPRS)
head(BPRS)


RATS$ID<-factor(RATS$ID)
RATS$Group<-factor(RATS$Group)
str(RATS)

#Convert the datasets to long form
library(dplyr)
library(tidyr)
BPRSL<-BPRS%>%gather(key=weeks, value=bprs, -treatment, -subject)
BPRSL<-BPRSL%>%mutate(week=as.integer(substr(weeks,5,5)))
glimpse(BPRSL)
RATSL<-RATS%>%gather(key=WDs, value=rats, -Group, -ID)
RATSL<-RATSL%>%mutate(time=as.integer(substr(WDs, 3, 4)))
glimpse(RATSL)


setwd("Z:\\IODS-project\\data")

write.csv(RATSL,file="RATSL.csv",row.names = FALSE)
write.csv(BPRSL,file="BPRSL.csv",row.names = FALSE)
