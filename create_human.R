#read datastes
hd<-read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")

#Explore data
str(hd)
dim(hd)
str(gii)
dim(gii)

#rename variables
colnames(hd)
colnames(hd)[1]<-"HDIrank"
colnames(hd)[2]<-"country"
colnames(hd)[3]<-"HDI"
colnames(hd)[4]<-"lifeExpBirth"
colnames(hd)[5]<-"ExpYrsOfEdu"
colnames(hd)[6]<-"meanYrsOfEdu"
colnames(hd)[7]<-"GNIperCPT"
colnames(hd)[8]<-"GNIperCPT-HDIrank"
colnames(hd)

colnames(gii)
colnames(gii)[1]<-"GIIrank"
colnames(gii)[2]<-"country"
colnames(gii)[3]<-"GII"
colnames(gii)[4]<-"mortalityratio"
colnames(gii)[5]<-"birthrate"
colnames(gii)[6]<-"RepPar"
colnames(gii)[7]<-"edu2F"
colnames(gii)[8]<-"edu2M"
colnames(gii)[9]<-"labF"
colnames(gii)[10]<-"labM"

#mutate and creage two new variables
gii<-mutate(gii, edu2Fby2M = edu2F/edu2M)
gii<-mutate(gii, labFbyM= labF/labM)
gii<-dplyr::select(gii, -edu2Fper2M)

join_by <- c("country")
human <- inner_join(hd, gii, by = join_by, suffix = c(".hd",".gii"))

human
glimpse(human)

write.table(human)
write.csv(human, 'Z:\\IODS-project\\data\\human.csv')
