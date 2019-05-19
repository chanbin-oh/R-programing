library(foreign)
library(ggplot2)
library(ggplot2)
library(dplyr)
library(readxl)

# ������ �ҷ�����

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

# ������ ���纻 �����

welfare <- raw_welfare

# ������ ������ �ٲٱ�

welfare <- rename(welfare,
                  sex= h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)



#### 09 - 2 ������ ���� ���� ����

### part 1. ���� ���� �� ��ó��

## 1. ���� ���� �����ϱ�

class(welfare$sex)
[1] "numeric"

table(welfare$sex)
1    2 
7578 9086 

## 2. ��ó��

table(welfare$sex)
1    2 
7578 9086 

# �̻�ġ ���� ó��

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# ����ġ Ȯ��

table(is.na(welfare$sex))

# ���� �׸� �̸� �ο�
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

female   male 
9086   7578 


## 1.���� ���� �����ϱ�

class(welfare$income)

[1] "numeric"

summary(welfare$income)

## Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
## 0.0   122.0   192.5   241.6   316.6  2400.0   12030 

## 2.��ó��

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

table(is.na(welfare$income))

FALSE  TRUE 
 4620 12044

### part2. ���� �� ���� �м�

## 1. ���� ���� ���ǥ �����
 
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>% 
  summarise(mean_income = mean(income))
sex_income

# A tibble: 2 x 2
sex    mean_income
<chr>        <dbl>
1 female        163.
2 male          312.

## 2. �׷��� �����

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()

