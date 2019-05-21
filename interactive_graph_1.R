##### 인터렉티브 코드

#### 12 -1 plotly 패키지로 인터렉티브 그래프 만들기

### 1. 패키지 준비하기

install.packages("plotly")
library(plotly)

### 2. ggplot2로 그래프 만들기

library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()

### 3. 인터렉티브 산점도 그래프 만들기

ggplotly(p)

### 4. 인터렉티브 막대 그래프 만들기

b <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")

ggplotly(b)

