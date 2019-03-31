### p. 123 분석도전!
## 문제1. ggplot2의 midwest 데이터를 데이터 프레임 형태로
##        불러온 다음 데이터의 특징을 파악하세
install.packages("ggplot2")
library(ggplot2)
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)
str(midwest)
dim(midwest)
summary(midwest)
## midwest 데이터 특징 파악하기
# 437개의 개체와 28개의 속성(변수), 범주형 변수: country, state, area, category,(inmetro) 연속형변수: 그 외 변수
# pop가 poppulation의 약자, perc가 percentage의 약자. midwest의 인종별 인구, 성인아동인구, 대학과 교수, 빈곤 등의
# 절대치와 상대치를 담은 데이터임.
# 상대치는 자치주 또는 국가별을 전체로 측정된 것으로 보임.

## 문제2. poptotal변수를 total로, popasian변수를 asian으로 수정하세요.
install.packages("dplyr")  # rename()함수 이용하기 위해서 패키지 다우
library(dplyr)
midwest_new <- midwest #복사본 만들
midwest_new <- rename(midwest_new, total = poptotal)
midwest_new <- rename(midwest_new, asian = popasian)
midwest_new  # 변수명이 수정된지 확인하기

## 문제3. total,asian변수를 이용해 '전체 인구 대비 아시아 인구 백분율' 파생변수를 만들고, 히스토그램을 만들어
##        도시들이 어떻게 분포하는지 살펴보세요.
midwest_new$precasian_total <- (midwest_new$asian / midwest_new$total) * 100
midwest_new$percasian_total
hist(midwest_new$percasian_total)

## 문제4. 아시아 인구 백분율 전체평균을 구하고 평균을 초과하면 "large", 그 외에는 "small"을 부여하는 파생변수를
##        만들어보세요.
summary(midwest_new$percasian)
midwest_new$test <- ifelse(midwest_new$percasian >= 0.4872, "large", "small")
head(midwest_new$percasian)
head(midwest_new$test)


## 문제4. "large"와 "small"에 해당하는 지역이 얼마나 되는지 빈도표와 빈도막대그래프를 만들어 확인해보세요.
table(midwest_new$percasian)
table(midwest_new$test)
qplot(midwest_new$test)
