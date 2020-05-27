#[지도 연습문제]

#1. R을 이용하여 서울시 한강 이남의 구청들의 위치에 
#    마커와 구청 이름을 지도 위에 표시하시오.

library(ggplot2)
library(ggmap)

register_google(key='AIzaSyA3PmQywLC-MoEA0DcFHobcNcSiSF9lhJk') #구글키 등록

library(ggmap)
data1 <- read.csv("R programming/서울시구청위치정보_new.csv")
head(data1)

map <- get_googlemap("seoul", zoom=11,maptype = 'roadmap')

map.map <- ggmap(map) + geom_point(data=data1, 
                                   aes(x=LON, y=LAT), 
                                   size=5, alpha=0.7)

map.map + geom_text(data=data1,
                    aes(x=LON, y=LAT+0.01, 
                    label=name),size=3)

x#2. '2018년도 시국구별 월별 교통사고 자료'로부터 

#서울시의 각 구별 1년 교통사고 발생건수를 지도상에 원의 크기로 나타내시오.
#- Sonar 원의 위치는 구의 위치로 하시오.
#- 원의 색은 red로 하고 투명도를 .05로 하시오.
#- 자료에는 월별로 데이터가 기록되어 있는데 1년 데이터를 합산하여 이용하시오.
#- 서울 지역이 모두 지도에 나도오록 하시오.


data <- read.csv("R programming/도로교통공단_시도_시군구별_교통사고_통계(2018)/도로교통공단_시도_시군구별_월별_교통사고(2018).csv")
head(data)

df1 <- subset(data, data$시도== "서울") 
df1

traffic <- aggregate(df1[,4:9], by=list(df1$시군구), FUN=sum)
traffic

gc <- geocode(enc2utf8(traffic$Group.1))
gc

cen <- c(mean(gc$lon),mean(gc$lat))

map <- get_googlemap(center=cen,
                     maptype = "roadmap",
                     zoom = 11)
ggmap(map)
gmap <- ggmap(map)
traffic <- data.frame(traffic,gc)
traffic
gmap+geom_point(data=traffic,
                aes(x=lon, y=lat, size=발생건수),
                alpha=0.5,                  
                col="red")+
  scale_size_continuous(range=c(1, 12))


#3. 2번과 동일한 자료를 이용하여 광역시도별 1년 사망자수를 지도상에 원의 크기로 나타내시오.
#- 세종시는 데이터에서 삭제하시오.
#- 원의 색은 black으로 하고 투명도를 .05로 하시오.
#- 남한 지역이 모두 지도에 나오도록 하시오.
head(data)
traffic <- aggregate(data[,4:9], by=list(data$시도), FUN=sum)
traffic
d <- traffic[-10,]
d

gc <- geocode(enc2utf8(d$Group.1))
gc

cen <- geocode(enc2utf8("충주시"))
cen= as.numeric(cen)

df <- data.frame(d,gc)
df
map <- get_googlemap(center=cen,
                     maptype = "roadmap",
                     zoom = 6)
ggmap(map)
gmap <- ggmap(map)

gmap+geom_point(data=df,
                aes(x=lon, y=lat, size=사망자수),
                alpha=0.5,                  
                col="black")+
  scale_size_continuous(range=c(1, 14))


#4. 2.번과 동일한 자료를 이용하여 광역시도별 7, 8월 부상자수를 지도상에 원의 크기로 나타내시오.
#- 세종시는 데이터에서 삭제하시오.
#- 원의 색은 black으로 하고 투명도를 .05로 하시오.
#- 남한 지역이 모두 지도에 나오도록 하시오.

head(data)
df2 <- subset(data, 월== "07월"|월== "08월") 
df2

df2 <- aggregate(df2[,4:9], by=list(df2$시도), FUN=sum)
df2
df2 <- df2[-10,]
df2

gc <- geocode(enc2utf8(df2$Group.1))
gc

cen <- geocode(enc2utf8("충주시"))
cen <-as.numeric(cen)

df <- data.frame(df2,gc)
df
map <- get_googlemap(center=cen,
                     maptype = "roadmap",
                     zoom = 6)
ggmap(map)
gmap <- ggmap(map)

gmap+geom_point(data=df,
                aes(x=lon, y=lat, size=부상자수),
                alpha=0.5,                  
                col="black")+
  scale_size_continuous(range=c(1, 10))
