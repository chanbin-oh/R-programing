##### 12 - 2 dygraphs 패키지로 인터렉티브 시계열 그래프 만들기

### 1. 패키지 설치 및 로드

install.packages("dygraphs")
library(dygraphs)

### 2. economics 데이터 불러오기

economics <- ggplot2::economics
head(economics)

# A tibble: 6 x 6
date         pce    pop psavert uempmed unemploy
<date>     <dbl>  <int>   <dbl>   <dbl>    <int>
  1 1967-07-01  507. 198712    12.5     4.5     2944
2 1967-08-01  510. 198911    12.5     4.7     2945
3 1967-09-01  516. 199113    11.7     4.6     2958
4 1967-10-01  513. 199311    12.5     4.9     3143
5 1967-11-01  518. 199498    12.5     4.7     3066
6 1967-12-01  526. 199657    12.1     4.8     3018

### 3. xts 데이터 타입으로 변환

library(xts)

eco <- xts(economics$unemploy, order.by = economics$date)

head(eco)

[,1]
1967-07-01 2944
1967-08-01 2945
1967-09-01 2958
1967-10-01 3143
1967-11-01 3066
1967-12-01 3018

### 4. 인터렉티브 시계열 그래프 만들기

dygraph(eco)

### 5. 날짜 범위 선택

dygraph(eco) %>% dyRangeSelector()

### 6. 여러 값 표현하기

# 저축률
eco_a <- xts(economics$psavert, order.by = economics$date) 

# 실업자 수
eco_b <- xts(economics$unemploy/1000, order.by = economics$date)

### 7. 6번 전처리

eco2 <- cbind(eco_a, eco_b)
colnames(eco2) <- c("psavert", "unemploy")
head(eco2)

             psavert unemploy
1967-07-01    12.5    2.944
1967-08-01    12.5    2.945
1967-09-01    11.7    2.958
1967-10-01    12.5    3.143
1967-11-01    12.5    3.066
1967-12-01    12.1    3.018

### 8. dygraph 그리기

dygraph(eco2) %>% dyRangeSelector()
