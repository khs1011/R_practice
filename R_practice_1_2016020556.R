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
data3<-gsub("¼­¿ï½Ã","",data3)
data3<-gsub("¼­¿ï","",data3)
data3<-gsub("¿äÃ»","",data3)
data3<-gsub("Á¦¾È","",data3)
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

data3<-gsub("´Ô","",data3)
data3<-gsub("ÇÑ","",data3)
data3<-gsub("°ü·Ã","",data3)
data3<-gsub("OO","",data3)
data3<-gsub("¹Î¿ø","",data3)
data3<-gsub("°ü¸®","",data3)

write(unlist(data3),"seoul_3.txt")
data4<-read.table("seoul_3.txt")
wordcount<-table(data4)
head(sort(wordcount,decreasing=T),20)

# Print Word Cloud
library(RColorBrewer)
palete<-brewer.pal(9,"Set3")

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=1,random.order=F,random.color=T,colors=palete)
legend(0.3,1,"R¿¬½À Stage 1",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")


############################################################
#REMAKE

data1<-readLines("remake.txt")
data1
data2<-sapply(data1,extractNoun,USE.NAMES=F)
data2
data3<-unlist(data2)
data3<-Filter(function(x){nchar(x)<=10},data3)
head(unlist(data3),30)
data3<-gsub("\\d+","",data3)
data3<-gsub("½Ö¼ö","½Ö²¨Ç®",data3)
data3<-gsub("½ÖÄ¿Ç®","½Ö²¨Ç®",data3)
data3<-gsub("\\.","",data3)
data3<-gsub(",","",data3)
data3<-gsub("\\","",data3)
data3
write(unlist(data3),"remake_2.txt")
data4<-read.table("remake_2.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount

head(sort(wordcount,decreasing=T),20)
txt<-readLines("remake_gsub.txt")
txt
cnt_txt<-length(txt)
i<-1
for(i in 1:cnt_txt){data3<-gsub((txt[i]),"",data3)}
data3
data3<-Filter(function(x){nchar(x)>=2},data3)
write(unlist(data3),"remake_2.txt")
data4<-read.table("remake_2.txt")
data4
nrow(data4)
wordcount<-table(data4)
wordcount
head(sort(wordcount,decreasing=T),30)

wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.25,min.freq=2,random.order=F,random.color=T,colors=palete)

legend(0.3,1,"¿©°í»ý ¼ºÇü¼ö¼ú",cex=0.8,fill=NA,border=NA,bg="white",text.col="red",text.font=2,box.col="red")
