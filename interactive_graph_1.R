##### ���ͷ�Ƽ�� �ڵ�

#### 12 -1 plotly ��Ű���� ���ͷ�Ƽ�� �׷��� �����

### 1. ��Ű�� �غ��ϱ�

install.packages("plotly")
library(plotly)

### 2. ggplot2�� �׷��� �����

library(ggplot2)
p <- ggplot(data = mpg, aes(x = displ, y = hwy, col = drv)) + geom_point()

### 3. ���ͷ�Ƽ�� ������ �׷��� �����

ggplotly(p)

### 4. ���ͷ�Ƽ�� ���� �׷��� �����

b <- ggplot(data = diamonds, aes(x = cut, fill = clarity)) +
  geom_bar(position = "dodge")

ggplotly(b)
