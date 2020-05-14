# R의 apply() 함수를 이용하여 다음 문제를 해결하는 R 코드를 작성하시오.
### apply ###

#iris 데이터셋의 행별 합계를 출력하시오.(5번째 열은 제외)
apply(iris[, 1:4], 1, sum)

#iris 데이터셋의 열별 최댓값을 출력하시오.(5번째 열은 제외)
apply(iris[, 1:4], 2, max)

mtcars

nrow(mtcars)
ncol(mtcars)
#mtcars 데이터셋의 열별 합계를 출력하시오.
apply(mtcars[,1:11],2,sum)
#mtcars 데이터셋의 열별 최댓값을 출력하시오.
apply(mtcars[,1:11],2,max)
#mtcars 데이터셋의 열별 표준편차를 출력하시오.
apply(mtcars[,1:11],2,sd)


#벡터의 최댓값과 최솟값을 반환(retrun)하는 R 함수 maxmin()

maxmin <- function(v){
  max = max(v)
  min = min(v)
  df = data.frame(max, min)
  return(df)
}

v1 <- c(7,1,2,8,9)
result <- maxmin(v1)
result
result$max
result$min

iris[,"Sepal.Length"]
result <- maxmin(iris[,1])
result$max
result$min



weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)

#몸무게가 가장 큰 값은 몇 번째에 있나?
which.max(weight)
#몸무게가 가장 작은 값은 몇 번째에 있나?
which.min(weight)
#몸무게가 61에서 69사이인 값들은 몇 번째에 있나?
which(weight >=61 & weight<=69)

#몸무게가 60 이하인 값들만 추출하여 wight.2에 저장하고 내용을 보이시오.

idx<- which(weight<=60)
idx
wight.2 <- weight[idx,]
wight.2



### which이용 ###
#iris 데이터셋에서 꽃잎의 길이(Petal.Length)가
#가장 큰 관측값(행)의 내용을 보이시오.

iris
which.max(iris$Petal.Length)

#iris 데이터셋에서 꽃잎의 폭(Petal.Width)이
#0.3 ~ 0.4 사이인 관측값(행)들의 내용을 보이시오.

idx<- which(iris$Petal.Width >=0.3 & iris$Petal.Width >=0.4)
idx




