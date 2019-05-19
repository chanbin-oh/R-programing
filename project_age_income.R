##### 09 - 5 ���̿� ������ ����

#### part1. ���� ���� �� ��ó��

### 1. ���� ���� �����ϱ�

class(welfare$birth)
[1] "numeric"

summary(welfare$birth)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
1907    1946    1966    1968    1988    2014 

### 2. ��ó��

## ����ġ Ȯ��

table(is.na(welfare$birth))

FALSE 
16664

## �̻�ġ ���� ó��
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

FALSE 
16664

## �Ļ����� �����

welfare$age <- 2019 - welfare$birth + 1
summary(welfare$age)

Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
6.00   32.00   54.00   52.43   74.00  113.00 


#### part 2, ���� ���� ���� �ľ��ϱ�

## 1. ���̿� ���� ���� ���ǥ �����

age_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income = mean(income))
head(age_income)

# A tibble: 6 x 2
age mean_income
<dbl>       <dbl>
  1    24        121.
2    25        106.
3    26        130.
4    27        142.
5    28        134.
6    29        145.

## 2. �׷��� �����
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()