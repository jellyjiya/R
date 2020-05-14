# R�� apply() �Լ��� �̿��Ͽ� ���� ������ �ذ��ϴ� R �ڵ带 �ۼ��Ͻÿ�.
### apply ###

#iris �����ͼ��� �ະ �հ踦 ����Ͻÿ�.(5��° ���� ����)
apply(iris[, 1:4], 1, sum)

#iris �����ͼ��� ���� �ִ��� ����Ͻÿ�.(5��° ���� ����)
apply(iris[, 1:4], 2, max)

mtcars

nrow(mtcars)
ncol(mtcars)
#mtcars �����ͼ��� ���� �հ踦 ����Ͻÿ�.
apply(mtcars[,1:11],2,sum)
#mtcars �����ͼ��� ���� �ִ��� ����Ͻÿ�.
apply(mtcars[,1:11],2,max)
#mtcars �����ͼ��� ���� ǥ�������� ����Ͻÿ�.
apply(mtcars[,1:11],2,sd)


#������ �ִ񰪰� �ּڰ��� ��ȯ(retrun)�ϴ� R �Լ� maxmin()

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

#�����԰� ���� ū ���� �� ��°�� �ֳ�?
which.max(weight)
#�����԰� ���� ���� ���� �� ��°�� �ֳ�?
which.min(weight)
#�����԰� 61���� 69������ ������ �� ��°�� �ֳ�?
which(weight >=61 & weight<=69)

#�����԰� 60 ������ ���鸸 �����Ͽ� wight.2�� �����ϰ� ������ ���̽ÿ�.

idx<- which(weight<=60)
idx
wight.2 <- weight[idx,]
wight.2



### which�̿� ###
#iris �����ͼ¿��� ������ ����(Petal.Length)��
#���� ū ������(��)�� ������ ���̽ÿ�.

iris
which.max(iris$Petal.Length)

#iris �����ͼ¿��� ������ ��(Petal.Width)��
#0.3 ~ 0.4 ������ ������(��)���� ������ ���̽ÿ�.

idx<- which(iris$Petal.Width >=0.3 & iris$Petal.Width >=0.4)
idx



