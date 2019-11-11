Donggyu Kam
6.11.2019

lrn14<-read.table("http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt", sep="\t", header=TRUE)
dim(lrn14)
str(lrn14)

#In order to take a look at the data dimenstions, I executed the code "dim()". As a result, the data has 183 rows and 60 columns. In addition, I excuted the code "str()" to take a look at the data frame. This data has 60 variables and each variable has 183 oberservations. 

#Create the columns related to the deep, the surface, and the strategic learning, respectively. 
library(dplyr)
deep_questions<-c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions<-c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions<-c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")
deep_columns<-select(lrn14, one_of(deep_questions))
surface_columns<-select(lrn14, one_of(surface_questions))
strategic_columns<-select(lrn14, one_of(strategic_questions))
lrn14$deep<-rowMeans(deep_columns)
lrn14$surf<-rowMeans(surface_columns)
lrn14$stra<-rowMeans(strategic_columns)

#Create an analysis dataset with 7 variables
keep_columns<-c("gender","Age", "Attitude", "deep","stra","surf","Points")
learning2014<-select(lrn14, one_of(keep_columns))
str(learning2014)
colnames(learning2014)[2]<-"age"
colnames(learning2014)[7]<-"points"
colnames(learning2014)[3]<-"attitude"
colnames(learning2014)
#To exclude observations where the exam points is zero
learning2014 <- filter(learning2014, points>0)
str(learning2014)


#set the workin directory
setwd("z:/IODS-project")

#Save the analysis dataset
write.csv(learning2014, "Z:\\IODS-project\\data\\learning2014.csv")

#read the dataset again
lrn2014<-read.csv("Z:\\IODS-project\\data\\learning2014.csv")
str(lrn2014)
head(lrn2014)

