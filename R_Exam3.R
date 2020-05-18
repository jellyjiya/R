attach(mtcars)


#중량(wt)의 평균값, 중앙값, 절사평균값(절사범위: 15%), 표준편차
mean(mtcars$wt)
median(mtcars$wt)
mean(mtcars$wt, trim=0.15)
sd(mtcars$wt)


#실린더수(cyl)에 대해 summary()함수의 적용 결과
summary(mtcars$cyl)


#앞에서 구한 도수분포표를 막대그래프로 출력
barplot(table(cyl))

#중량(wt)의 히스토그램을 출력
hist(mtcars$wt,col='skyblue')
#중량(wt)에 대한 상자그림을 출력/ 정보도
boxplot(wt)
boxplot.stats(mtcars$wt)
#배기량(disp)에 대한 상자그림을 출력/ 정보도 함께
boxplot(mtcars$disp)
boxplot.stats(mtcars$disp)

#기어수(gea를 그룹 정보로 하여 연비(mpg)자료에 대해 상자그림을 작성하고,
  #각 그룹의 상자그림을 비교하여 관찰할 수 있는 것이 무엇인지 나타내시오.
boxplot(mpg~gear)

