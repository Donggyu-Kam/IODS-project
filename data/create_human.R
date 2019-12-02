#Read data
human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep=",", header=T)

#Explore dataset structure and summary of dataset
str(human)
summary(human)

#Look at the column names 
names(human)


# access the stringr package
library(stringr)

# look at the structure of the GNI column in 'human'
str(human$GNI)

# remove the commas from GNI and print out a numeric version of it
str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric

# columns to keep
keep <- c("Country", "Edu2.FM", "Labo.FM", "Life.Exp", "Edu.Exp", "GNI", "Mat.Mor", "Ado.Birth", "Parli.F")

# select the 'keep' columns
human <- select(human, one_of(keep))

# print out a completeness indicator of the 'human' data
complete.cases(human)

# print out the data along with a completeness indicator as the last column
data.frame(human[-1], comp = complete.cases(human))

# filter out all rows with NA values
human_ <- filter(human, complete.cases(human))

# look at the last 10 observations
tail(human, 10)

# last indice we want to keep
last <- nrow(human_) - 7

# choose everything until the last 7 observations
human_ <- human_[1:last, ]



library(dplyr)
# remove the Country variable
human_<- select(human_, -Country)


# Access GGally
library(GGally)

# visualize the 'human_' variables
ggpairs(human_)
human_

# compute the correlation matrix and visualize it with corrplot
cor(human_) %>% corrplot

glimpse(human_)
write.table(human_)
write.csv(human, 'Z:\\IODS-project\\data\\human.csv')
