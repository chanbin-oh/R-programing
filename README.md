# R-programing
# 확률과 통계, 사회과학통계분석



# ggplot 패키지 로드
install.packages("ggplot2")  ## 패키지 설치 시 문자열로 처리
library(ggplot)


# 여러 문자로 구성된 변수 생성
x <- c("a", "a", "b", "c")
x

# 빈도 막대 그래프 출력
qplot(X)

# data에 mpg, x축에 hwy 변수 지정해 그래프 생성
qplot(data = mpg, x = hwy)

# x축 cty 
qplot(data = mpg, x = cty)

# x축 drv, y축 hwy
qplot(data = mpg, x = drv, y = hwy)

# x축 drv, y축 hwy, 선그래프
qplot(data = mpg, x = drv, y = hwy, geom = "line")

# x축 drv, y축 hwy, 상자 그림 형태
qplot(data = mpg, x = drv, y = hwy, geom = "boxplot")

# x축 drv, y축 hwy, 상자 그림 형태, drv별 색 표현
qplot(data = mpg, x = drv, y = hwy, geom "boxplot", colour = drv)


## 실습과제-혼자서 해보기
grade <- c(80, 60, 70, 50, 90)
mean(grade)
mean_grade <- mean(grade)



