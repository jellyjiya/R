# state.x77 �����ͼ��� �̿�
state.x77

# state.x77�� ��ȯ�Ͽ� st�� ���������������� ����
st <-  data.frame(state.x77)
st

#st�� ������ ���
class(st)
head(st)

#st�� ���̸��� ���
colnames(st)
#st�� ���̸� ���
rownames(st)
#st�� ��� ������ ���� ������ ���
dim(iris)

#st�� �������
str(iris)

#st�� �ະ �հ�� ���
rowSums(st)  # �ະ �հ� 
rowMeans(st) # �ະ ���

#st�� ���� �հ�� ���
colSums(st) # ���� �հ� 
colMeans(st) # ���� ���

#Florida ���� ��� ����
st["Florida",]

#50�� ���� ����(Incom) ����
st[,"Income"]

#Texas ���� ����(Area)
st["Texas","Area"]

#Ohio ���� �α�(Population)�� ����(Income)
st["Ohio",c("Population","Income")]

#�α��� 5,000 �̻��� ���� ������
subset(st,Population>5000)

#������ 4,500 �̻��� ���� �α�, ����, ������ ���
subset(st,Income>4500,c("Population","Income","Area"))

#������ 4,500 �̻��� �ִ� �� ������ 
table(st["Income"]>=4500)

#��ü ����(Area)�� 100,000 �̻�,����ϼ�(Frost)�� 120 �̻��� ���� ������ ���
stst <- subset(st,Area>=100000 & Frost>=120) 
stst


#�α�(Population)�� 2,000 �̸�, ������(Murder)�� 12 �̸��� ���� ����
st_2 <-  subset(st,Population<2000 & Murder<12)
st_2

#���ͷ�(Illiteracy)�� 2.0 �̻��� ���� ��� ����
colMeans(subset(st, Illiteracy >=2.0)["Income"])  
  ## colMeans(st["Income"])
  ## a <- st["Illiteracy" >= 2.0,"Income"]
  
  #�Ȱ��� ill_income = subset(st, Illiteracy >= 2.0)
  #colMeans(ill_income["Income"])
  ## a
  
  ##  mean(a)

#���ͷ�(Illiteracy)�� 2.0 �̸��� �ֿ� 2.0 �̻��� ���� ��� ������ ����
colMeans(subset(st, Illiteracy<2.0)["Income"])-colMeans(subset(st, Illiteracy >=2.0)["Income"])  


#������(Life Exp)�� ���� ���� ��
max(st[,"Life.Exp"])

#Pennsylvania �ֺ��� ����(Income)���� ��
st[,"Income">st["Pennsylvania","Income"]]