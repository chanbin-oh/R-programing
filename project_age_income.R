##### 09 - 5 나이와 월급의 관계

#### part1. 변수 검토 및 전처리

### 1. 나이 변수 검토하기

class(welfare$birth)
[1] "numeric"

summary(welfare$birth)
Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
1907    1946    1966    1968    1988    2014 

### 2. 전처리

## 결측치 확인

table(is.na(welfare$birth))

FALSE 
16664

## 이상치 결측 처리
welfare$birth <- ifelse(welfare$birth == 9999, NA, welfare$birth)
table(is.na(welfare$birth))

FALSE 
16664

## 파생변수 만들기

welfare$age <- 2019 - welfare$birth + 1
summary(welfare$age)

Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
6.00   32.00   54.00   52.43   74.00  113.00 


#### part 2, 변수 간의 관계 파악하기

## 1. 나이에 따른 월급 평균표 만들기

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

## 2. 그래프 만들기
ggplot(data = age_income, aes(x = age, y = mean_income)) + geom_line()
