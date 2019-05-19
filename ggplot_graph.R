#### ������ �����

### 1. ��� �����ϱ�

## x���� displ, y���� hwy�� ������ ��� ����
ggplot(data = mpg, aes(x = displ, y = hwy))

### 2. ��� �߰��ϱ�

## ��濡 ������ �߰��ϱ�
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

### 3. �� ������ �����ϴ� ���� �߰��ϱ�

## x�� ���� 3~6���� ����
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)




#### ����׷���

### 1. ���ܺ� ���ǥ �����

library(dplyr)

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

### 2. �׷��� �����ϱ�

ggplot(data = df_mpg, aes(x =drv, y = mean_hwy)) + geom_col() 

### 3. ũ�� ������ ����

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col() 


#### ���� �׸� ����

### 1. ���ڱ׸� �����

ggplot(data = mpg, aes(x = drv, y= hwy)) + geom_boxplot()