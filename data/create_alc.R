Donggyu Kam
17.11.2019

The data is about student acheivement in secondary education of two Portugues schools. Two datasets are available for the performance in two subjects: Math and Portuguese language.  
P. Cortez and A. Silva. Using Data Mining to Predict Secondary School Student Performance. In A. Brito and J. Teixeira Eds., Proceedings of 5th FUture BUsiness TEChnology Conference (FUBUTEC 2008) pp. 5-12, Porto, Portugal, April, 2008, EUROSIS, ISBN 978-9077381-39-7.
[link]http://www3.dsi.uminho.pt/pcortez/student.pdf
Data source:http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets

url<-"http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets"
url_math<-paste(url, "student-mat.csv", sep="/")
url_por<-paste(url, "student-por.csv", sep="/")                
math<-read.table(url_math, sep =";", header=TRUE)
por<-read.table(url_por, sep=";", header=TRUE)
str(math)
str(por)
dim(math)
dim(por)


#join the two datasets
library(dplyr)
join_by<-c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet")
math_por<-inner_join(math, por, by = join_by, suffix=c(".math", ".por"))
colnames(math_por)
glimpse(math_por)

#combining the duplicated answers
colnames(math_por)
alc<-select(math_por, one_of(join_by))
notjoined_columns<-colnames(math[!colnames(math)%in% join_by])
notjoined_columns
for(column_name in notjoined_columns){
  two_columns <- select(math_por, starts_with(column_name))
  first_column<-select(two_columns, 1)[[1]]
  if(is.numeric(first_columns)){
    alc[column_name]<-round(rowMeans(two_columns))
  }else{
    alc[column_name]<-first_column
  }
}
glimpse(alc)

#Create a new column "alc_use" for answers related to alco comsuption
library(ggplot2)
alc<-mutate(alc, alc_use=(Dalc + Walc)/2)
colnames(alc)
## create a new logical column 
g1<-ggplot(data=alc, aes(x= alc_use))
g1+geom_bar()
alc<-mutate(alc, high_use=alc_use<2)
g2<-ggplot(data=alc, aes(x=alc_use))
g2+geom_bar()+facet_wrap("sex")
glimpse(alc)
write.csv(alc, file="Z:\\IODS-project\\data\\alc.csv")
