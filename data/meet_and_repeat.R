#Donggyu Kam, 08.12.2019

#Read table
bprs<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep="", header=T)
str(bprs)
summary(bprs)
head(bprs,3)

rats<-read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep="\t",header=TRUE)
str(rats)
summary(rats)
