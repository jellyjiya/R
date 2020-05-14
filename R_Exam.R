# state.x77 데이터셋을 이용
state.x77

# state.x77을 변환하여 st에 데이터프레임으로 저장
st <-  data.frame(state.x77)
st

#st의 내용을 출력
class(st)
head(st)

#st의 열이름을 출력
colnames(st)
#st의 행이름 출력
rownames(st)
#st의 행과 개수와 열의 개수를 출력
dim(iris)

#st의 요약정보
str(iris)

#st의 행별 합계와 평균
rowSums(st)  # 행별 합계 
rowMeans(st) # 행별 평균

#st의 열별 합계와 평균
colSums(st) # 열별 합계 
colMeans(st) # 열별 평균

#Florida 주의 모든 정보
st["Florida",]

#50개 주의 수입(Incom) 정보
st[,"Income"]

#Texas 주의 면적(Area)
st["Texas","Area"]

#Ohio 주의 인구(Population)와 수입(Income)
st["Ohio",c("Population","Income")]

#인구가 5,000 이상인 주의 데이터
subset(st,Population>5000)

#수입이 4,500 이상인 주의 인구, 수입, 면적을 출력
subset(st,Income>4500,c("Population","Income","Area"))

#수입이 4,500 이상인 주는 몇 개인지 
table(st["Income"]>=4500)

#전체 면적(Area)이 100,000 이상,결빙일수(Frost)가 120 이상인 주의 정보를 출력
stst <- subset(st,Area>=100000 & Frost>=120) 
stst


#인구(Population)가 2,000 미만, 범죄율(Murder)이 12 미만인 주의 정보
st_2 <-  subset(st,Population<2000 & Murder<12)
st_2

#문맹률(Illiteracy)이 2.0 이상인 주의 평균 수입
colMeans(subset(st, Illiteracy >=2.0)["Income"])  
  ## colMeans(st["Income"])
  ## a <- st["Illiteracy" >= 2.0,"Income"]
  
  #똑같음 ill_income = subset(st, Illiteracy >= 2.0)
  #colMeans(ill_income["Income"])
  ## a
  
  ##  mean(a)

#문맹률(Illiteracy)이 2.0 미만인 주와 2.0 이상인 주의 평균 수입의 차이
colMeans(subset(st, Illiteracy<2.0)["Income"])-colMeans(subset(st, Illiteracy >=2.0)["Income"])  


#기대수명(Life Exp)이 가장 높은 주
max(st[,"Life.Exp"])

#Pennsylvania 주보다 수입(Income)높은 주
st[,"Income">st["Pennsylvania","Income"]]