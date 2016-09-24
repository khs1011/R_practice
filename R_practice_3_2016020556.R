# Big Data _ R Practice : Stage 3
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

#################################
# Stage 3                       #
#################################

#### 예제 3-4

count <- read.csv("연도별요양기관별보험청구건수_2001_2013_세로.csv",stringsAsFactors=FALSE)
count

colname<-count$년도

v1 <- count[,2]/100000
v2 <- count[,3]/100000
v3 <- count[,4]/100000
v4 <- count[,5]/100000
v5 <- count[,6]/100000
v6 <- count[,7]/100000
v7 <- count[,8]/100000
v8 <- count[,9]/100000
v9 <- count[,10]/100000
v10 <- count[,11]/100000

plot(v1,xlab="",ylab="",ylim=c(0,6000),axes=FALSE,col="violet",type="o",lwd=2,
     main=paste("연도별 요양 기관별 보험 청구 건수(단위:십만건)","\n", 
                "출처:건강보험심사평가원"))

axis(1,at=1:10,label=colname,las=2)
axis(2,las=1)

lines(v2 ,col="blue",type="o",lwd=2)
lines(v3 ,col="red",type="o",lwd=2)
lines(v4 ,col="black",type="o",lwd=2)
lines(v5 ,col="orange",type="o",lwd=2)
lines(v6 ,col="green",type="o",lwd=2)
lines(v7 ,col="cyan",type="o",lwd=2)
lines(v8 ,col="yellow",type="o",lwd=2)
lines(v9 ,col="brown",type="o",lwd=2)
lines(v10 ,col="pink",type="o",lwd=2)

abline(h=seq(0,6000,500),v=seq(1,100,1),lty=3,lwd=0.2)

col <- names(count[1,2:10])

colors <- c("violet","blue","red","black","orange","green","cyan","yellow","brown","pink")

legend(1,6000,col,cex=0.8,col=colors,lty=1,lwd=2,bg="white")


#########################################################################
### 도전 미션 3-5. 전염병 예방
#########################################################################

vir <- read.csv("1군전염병발병현황_년도별.csv",sep=",",stringsAsFactors = FALSE)

colname <- vir$년도별
colname

v1 <- vir[,2]
v1
v2 <- vir[,3]
v3 <- vir[,4]
v4 <- vir[,5]
v5 <- vir[,6]

plot(v1,xlab="",ylab="",ylim=c(0,6000),axes=FALSE,col="violet",type="o",lwd=2,main="1군 전염병 발병현황-년도별(단위:건수)  출처:통계청")

axis(1,at=1:11,label=colname,las=2)
axis(2,las=1)

lines(v2 ,col="blue",type="o",lwd=2)
lines(v3 ,col="red",type="o",lwd=2)
lines(v4 ,col="black",type="o",lwd=2)
lines(v5 ,col="orange",type="o",lwd=2)

abline(h=seq(0,6000,1000),v=seq(1,11,1),lty=1,lwd=0.2)

col <- names(vir[2:6])
colors <- c("violet","blue","red","black","orange")
legend(1,6000,col,cex=0.8,col=colors,lty=1,lwd=2,bg="white")

vir2 <- read.csv("1군전염병발병현황_월별.csv",sep=",",stringsAsFactors = FALSE)
colname<-vir2$월별
colname

vir2

v1<-vir2[,2]
v1
v2<-vir2[,3]
v3<-vir2[,4]
v4<-vir2[,5]
v5<-vir2[,6]

plot(v1,xlab="",ylab="",ylim=c(0,1200),axes=FALSE,col="violet",type="o",lwd=2,main="1군 전염병 발병현황-월별(단위:건수)  출처:통계청")
axis(1,at=1:12,label=colname,las=2)
axis(2,las=1)

lines(v2 ,col="blue",type="o",lwd=2)
lines(v3 ,col="red",type="o",lwd=2)
lines(v4 ,col="black",type="o",lwd=2)
lines(v5 ,col="orange",type="o",lwd=2)

abline(h=seq(0,1200,200),v=seq(1,12,1),lty=1,lwd=0.2)

col <- names(vir2[2:6])
colors <- c("violet","blue","red","black","orange")
legend(1,1200,col,cex=0.8,col=colors,lty=1,lwd=2,bg="white")

########################################
# Stage 4                              #
########################################

install.packages("ggmap")
install.packages("stringr")

library(ggmap)
install.packages("ggplot2")
install.packages("RJSONIO")

library(stringr)

loc<-read.csv("서울_강동구_공영주차장_위경도.csv",header=T)
loc

kd<-get_map("Amsa-dong",zoom=13,maptype="roadmap")
kd
kor.map<-ggmap(kd)+geom_point(data=loc,aes(x=LON,y=LAT),size=3,alpha=0.7,color="red")
kor.map+geom_text(data=loc,aes(x=LON,y=LAT+0.001,label=주차장명),size=3)
ggsave("kd.png",dpi=500)


loc<-read.csv("지역별장애인도서관정보.csv",header=T)
loc
sel<-get_map("seoul", zoom=11, maptype="hybrid")
sel.map<-ggmap(sel)+geom_point(data=loc,aes(x=LON,y=LAT),size=5,alpha=0.7,color="red")
sel.map+geom_text(data=loc,aes(x=LON,y=LAT+0.01,label=자치구명),size=3)
ggsave("sel.png",dpi=500)

================= END ============================
