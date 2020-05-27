register_google(key='AIzaSyA3PmQywLC-MoEA0DcFHobcNcSiSF9lhJk') #구글키 등록


# 1. 01) 20대 국회 개원 여.야 3당 대표 국회연설문에 대해 
# 각각 워드클라우드를 작성하시오. * 예제소스 : ex_10-1.txt, ex_10-2.txt, ex_10-3.txt

library(KoNLP)
library(rJava)

library(wordcloud)
library(RColorBrewer)

setwd("C:/Users/TJ/Documents/R programming/wordcloud_file")
text <- readLines("ex_10-1.txt", encoding = "UTF-8") # 파일읽기
buildDictionary(ext_dic = "woorimalsam")                  # '우리말씀' 한글사전 읽기
pal2 <- brewer.pal(8, "Dark2")                            # 명사추출
noun <- sapply(text, extractNoun, USE.NAMES = F)          # 추출된 명사 출력
noun

noun2 <- unlist(noun) # 명사를 합쳐 색출
wordcount <- table(noun2) # 단어 출현 수 계산
temp <- sort(wordcount, decreasing=T)[1:10] # 단어 정렬
temp # 확인

temp <- temp[-1] # 공백단어 제거
barplot(temp, las = 2, names.arg = names(temp), # 그래프 출력    
        col ="lightblue", main ="Most frequent words", # 축, 제목 입력       
        ylab = "Word frequencies") # 축 입력

wordcloud(names(wordcount), # 단어들
          freq=wordcount, # 단어들의 빈도
          scale=c(6,0.7), # 단어의 폰트 크기
          min.freq=3, # 단어의 최소빈도
          random.order=F, # 단어의 출력위치
          rot.per=.1, # 90도회전 단어 비율
          colors=pal2) # 단어색

text <- readLines("ex_10-2.txt", encoding = "UTF-8") # 파일읽기
buildDictionary(ext_dic = "woorimalsam")                  # '우리말씀' 한글사전 읽기
pal2 <- brewer.pal(8, "Dark2")                            # 명사추출
noun <- sapply(text, extractNoun, USE.NAMES = F)          # 추출된 명사 출력
noun

text <- readLines("ex_10-3.txt", encoding = "UTF-8") # 파일읽기
buildDictionary(ext_dic = "woorimalsam")                  # '우리말씀' 한글사전 읽기
pal2 <- brewer.pal(8, "Dark2")                            # 명사추출
noun <- sapply(text, extractNoun, USE.NAMES = F)          # 추출된 명사 출력
noun


#2.01) 네이버 데이터랩에서 주제어를 '캠핑'과 '텐트'로 하여 최근 1년 간의 검색 트렌드를 확인하되, 25세 이상과 30대 소비자를 대상으로 남성과 여성을 각각 구분하고, 그래프에서 어떤 차이가 발견되는지 설명하시오.

 코로나의 영향으로 아웃도어 상품들의 매출이 늘었다. 3월 17일을 기준으로 많은 매출을 기록하였고,
 텐트의 판매량이 평소 판매량의 약 3~4배가 이루어졌다는 것을 알 수 있다.

  #02) 네이버 데이터랩의 지역통계 메뉴에서 서울 종로구와 강원도 태백시에 대해 인기 업종을 '관광'으로 하여 최근 1년간 검색 트렌드를 비교하시오. 
     #그리고 종로구와 태백시의 그래프에서 어떤 차이가 발견되는지 관찰하시오.
    

#3. 공공데이터포털에서 서울시 서대문구의 유치원 현황(2014년 9월) 자료를 다운로드하여 유치원의 위치를 지도상에 마커로 표시하시오.
#(유치원 주소를 위도와 경도로 변환하지 못하는 곳도 있는데, 이곳은 마커 표시 대상에서 제외한다.)

register_google(key='AIzaSyA3PmQywLC-MoEA0DcFHobcNcSiSF9lhJk') #구글키 등록

library(ggplot2)
library(ggmap)

data2 <- read.csv("C:/Users/TJ/Documents/R programming/wordcloud_file/유치원_현황.csv")
head(data2)

gc <- geocode(enc2utf8(data2$"소.재.지"))
gc



df <- data.frame(name=data2$유.치.원.명,
                 lon= gc$lon,
                 lat= gc$lat)
df

cen <- c(mean(df$lon),mean(df$lat))


map <- get_googlemap(center = cen, 
                     maptype = 'roadmap',
                     zoom=11,
                     size = c(640,640),
                     marker = gc)

ggmap(map)

gmap + geom_text(data=data2,
                    aes(x=lon, y=lat),
                        label=df$name,
                        size=3)



#4. 공동데이터포털에서 '2016년도 시도 시군구별 교통사고' 통계를 다운로드하시오. 다운로드한 파일 중에서'2016년_시도_시군구별_월별_교통사고.csv'에 대해 다음 물음에 답하세요.

#01) 월별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.
#02) 시도별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.


#5. 국가통계포털 사이트에서 '2016년도 전국 음식점 정보 통계'를 가져와서 '채식전문점'이 위치한 시도를 출력하세요.






