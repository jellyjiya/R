attach(mtcars)


#�߷�(wt)�� ��հ�, �߾Ӱ�, ������հ�(�������: 15%), ǥ������
mean(mtcars$wt)
median(mtcars$wt)
mean(mtcars$wt, trim=0.15)
sd(mtcars$wt)


#�Ǹ�����(cyl)�� ���� summary()�Լ��� ���� ���
summary(mtcars$cyl)


#�տ��� ���� ��������ǥ�� ����׷����� ���
barplot(table(cyl))

#�߷�(wt)�� ������׷��� ���
hist(mtcars$wt,col='skyblue')
#�߷�(wt)�� ���� ���ڱ׸��� ���/ ������
boxplot(wt)
boxplot.stats(mtcars$wt)
#��ⷮ(disp)�� ���� ���ڱ׸��� ���/ ������ �Բ�
boxplot(mtcars$disp)
boxplot.stats(mtcars$disp)

#����(gea�� �׷� ������ �Ͽ� ����(mpg)�ڷῡ ���� ���ڱ׸��� �ۼ��ϰ�,
  #�� �׷��� ���ڱ׸��� ���Ͽ� ������ �� �ִ� ���� �������� ��Ÿ���ÿ�.
boxplot(mpg~gear)
