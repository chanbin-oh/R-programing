#### 산점도 만들기

### 1. 배경 설정하기

## x축은 displ, y축은 hwy로 지정해 배경 설정
ggplot(data = mpg, aes(x = displ, y = hwy))

### 2. 배경 추가하기

## 배경에 산점도 추가하기
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

### 3. 축 범위를 조정하는 설정 추가하기

## x축 범위 3~6으로 지정
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)




#### 막대그래프

### 1. 집단별 평균표 만들기

library(dplyr)

df_mpg <- mpg %>%
  group_by(drv) %>%
  summarise(mean_hwy = mean(hwy))

df_mpg

### 2. 그래프 생성하기

ggplot(data = df_mpg, aes(x =drv, y = mean_hwy)) + geom_col() 

### 3. 크기 순으로 정렬

ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col() 


#### 상자 그림 분포

### 1. 상자그림 만들기

ggplot(data = mpg, aes(x = drv, y= hwy)) + geom_boxplot()
