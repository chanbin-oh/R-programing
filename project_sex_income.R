library(foreign)
library(ggplot2)
library(ggplot2)
library(dplyr)
library(readxl)

# 데이터 불러오기

raw_welfare <- read.spss(file = "Koweps_hpc10_2015_beta1.sav", to.data.frame = T)

# 데이터 복사본 만들기

welfare <- raw_welfare

# 데이터 변수명 바꾸기

welfare <- rename(welfare,
                  sex= h10_g3,
                  birth = h10_g4,
                  marriage = h10_g10,
                  religion = h10_g11,
                  income = p1002_8aq1,
                  code_job = h10_eco9,
                  code_region = h10_reg7)



#### 09 - 2 성별에 따른 월급 차이

### part 1. 변수 검토 및 전처리

## 1. 성별 변수 검토하기

class(welfare$sex)
[1] "numeric"

table(welfare$sex)
1    2 
7578 9086 

## 2. 전처리

table(welfare$sex)
1    2 
7578 9086 

# 이상치 결측 처리

welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)

# 결측치 확인

table(is.na(welfare$sex))

# 성별 항목 이름 부여
welfare$sex <- ifelse(welfare$sex == 1, "male", "female")
table(welfare$sex)

female   male 
9086   7578 


## 1.월급 변수 검토하기

class(welfare$income)

[1] "numeric"

summary(welfare$income)

## Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
## 0.0   122.0   192.5   241.6   316.6  2400.0   12030 

## 2.전처리

welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)

table(is.na(welfare$income))

FALSE  TRUE 
 4620 12044

### part2. 변수 간 관계 분석

## 1. 성별 월급 평균표 만들기
 
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

## 2. 그래프 만들기

ggplot(data = sex_income, aes(x = sex, y = mean_income)) + geom_col()


