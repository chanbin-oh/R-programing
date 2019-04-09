### 이상치 제거하기 - 혼자서 해보디
## mpg데이터를 이용해 분석 문제를 해결해보세요.
# 우선 mpg 데이터를 불러와 이상치를 만들어보겠습니다.
# mpg <- as.data.frame(ggplot2::mpg)
# mpg[c(10, 14, 58, 93), "drv"] <- "k"
# mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
# 이상치가 있는 mpg데이터를 활용해 문제를 해결해보세요.
# 구동 방식별로 도시 연비가 다른지 알아보려고 합니다. 분석을 하기 전에 우선 두 변수에 이상치가 있는지 확인하려고 합니다.
#
# Q1. drv에 이상치가 있는지 확인하세요. 이상치를 결측 처리한 후 이상치가 사라졌는지 확인하세요.
#     결측처리할 때는 %in% 기호를 활용하세요.
mpg <- as.data.frame(ggplot2::mpg)
mpg[c(10, 14, 58, 93), "drv"] <- "k"
mpg[c(29, 43, 129, 203), "cty"] <- c(3, 4, 39, 42)
#
is.na(mpg$drv)
mpg$drv
table(mpg$drv)
mpg$drv <- ifelse(mpg$drv %in% "k", NA, mpg$drv)
table(mpg$drv)
table(is.na(mpg$drv))
#
# Q2. 상자 그림을 이용해 cty에 이상치가 있는지 확인하세요. 상자 그림의 통계치를 이용해 정상 범위를 벗어난
#     값을 결측 처리한 후 다시 상자그림을 만들어 이상치가 사라졌는지 확인하세요.
boxplot(mpg$cty)
boxplot(mpg$cty)$stats
# 정상 범위 파악 -> 9에서 26까지 분포
mpg$cty <- ifelse(mpg$cty < 9 | mpg$cty > 26, NA, mpg$cty)
boxplot(mpg$cty)
#
# Q3. 두 변수의 이상치를 결측처리 했으니 이제 분석할 차례입니다. 이상치를 제외한 다음 drv별로 cty평균이 어떻게 다른지 알아보세요.
#     하나의 dplyr 구문으로 만들어야 합니다.
mpg %>% 
  filter(!is.na(drv)) | !is.na(cty) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))
