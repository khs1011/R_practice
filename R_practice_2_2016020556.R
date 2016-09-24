# Big Data _ R Practice : Stage 1
# 2016020556 Kim Hyung Sun

# Work Direcory
setwd("c://Brian/GitHub/R_practice")

# Install Packages
install.packages("KoNLP")
install.packages("wordcloud")
install.packages("stringr")

library(KoNLP)
library(wordcloud)
library(stringr)
useSejongDic()
mergeUserDic(data.frame(readLines("제주도여행지.txt"),"ncn"))

txt<-readLines("jeju.txt")
place<-sapply(txt,extractNoun,USE.NAMES=F)
place
head(unlist(place),30)
cdata<-unlist(place)
place<-str_replace_all(cdata,"[^[:alpha:]]","")
place<-gsub(" ","",place)
txt<-readLines("제주도여행코스gsub.txt")
txt
cnt_txt<-length(txt)
cnt_txt
for(i in 1:cnt_txt){
  place<-gsub((txt[i]),"",place)
}

place
place<-Filter(function(x){nchar(x)>2},place)
write(unlist(place),"jeju_2.txt")
rev<-read.table("jeju_2.txt")
nrow(rev)
wordcount<-table(rev)
wordcount
head(sort(wordcount,decreasing=T),10)

rev

top10<-head(sort(wordcount,decreasing=T),10)
pie(top10,main="제주도 추천 여행코스 TOP 10")
pie(top10,col=rainbow(10),radius=1,main="제주도 추천 여행코스 TOP 10")

pct<-round(top10/sum(top10)*100,1)
names(top10)
lab<-paste(names(top10),"\n",pct,"%")
pie(top10,col=rainbow(10),radius=1,main="제주도 추천 여행코스 TOP 10",cex=0.8,labels=lab)

bchart<-head(sort(wordcount,decreasing=T),10)
bchart
rev
bp<-barplot(bchart,main="제주도 추천 여행코스 TOP 10",col=rainbow(10),cex.names=0.7,las=2,ylim=c(0,25))


pct<-round(bchart/sum(bchart)*100,1)
pct
text(x=bp,y=bchart*1.05,labels=paste("(",pct,"%",")"),col="black",cex=0.7)
text(x=bp,y=bchart*0.95,labels=paste(bchart,"건"),col="black",cex=0.7)

barplot(bchart,main="제주도 추천 여행코스 TOP 10",col=rainbow(10),xlim=c(0,25),cex.name=0.7,las=1,horiz=T)
text(y=bp,x=bchart*1.15,labels=paste("(",pct,"%",")"),col="black",cex=0.7)
text(y=bp,x=bchart*0.95,labels=paste(bchart,"건"),col="black",cex=0.7)

install.packages("plotrix")
library(plotrix)
th_pct<-round(bchart/sum(bchart)*100,1)
th_names<-names(bchart)
th_labels<-paste(th_names,"\n","(",th_pct,")")
pie3D(bchart,main="제주도 추천 여행코스 TOP 10",col=rainbow(10),cex=0.3,labels=th_labels,explode=0.05)
