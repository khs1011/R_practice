# Big Data _ R Practice : Stage 1
# 2016020556 Kim Hyung Sun

# Work Direcory
setwd("c://Brian/GitHub/R_practice")

# Install Packages
install.packages("KoNLP")
install.packages("wordcloud")
library(KoNLP)
library(wordcloud)
useSejongDic()

# Read Original File
data1<-readLines("seoul_new.txt")
data1

# Filter only nouns
data2<-sapply(data1,extractNoun,USE.NAMES=F)
data2

head(unlist(data2),30)
data3<-unlist(data2)

# Pre processing data
data3<-gsub("\\d+","",data3) ##
data3<-gsub("서울시","",data3)
data3<-gsub("서울","",data3)
data3<-gsub("요청","",data3)
data3<-gsub("제안","",data3)
data3<-gsub(" ","",data3)
data3<-gsub("-","",data3)

# Write to the file
write(unlist(data3),"seoul_2.txt")

data4<-read.table("seoul_2.txt")
data4

# data count
nrow(data4)

wordcount<-table(data4)
wordcount

head(sort(wordcount,decreasing=T),20)

data3<-gsub("님","",data3)
data3<-gsub("한","",data3)
data3<-gsub("관련","",data3)
data3<-gsub("OO","",data3)
data3<-gsub("민원","",data3)
data3<-gsub("관리","",data3)

write(unlist(data3),"seoul_3.txt")
data4<-read.table("seoul_3.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing=T),20)

# Print Word Cloud
library(RColorBrewer)
palete<-brewer.pal(9,"Set3")

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,random.order=F,random.color=T,colors=palete)
legend(0.3,1,"R연습 Stage 1",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")
