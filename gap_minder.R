##### GAP_MINDER

### 갭 마인더 불러오기

install.packages("gapminder")
library(gapminder)


aggregate(lifeExp ~ continent, gapminder, median)

  continent lifeExp
1    Africa 47.7920
2  Americas 67.0480
3      Asia 61.7915
4    Europe 72.2410
5   Oceania 73.6650

library("dplyr")
gapminder %>% 
  filter(year == 2007) %>% 
  group_by(continent) %>% 
  summarise(lifeExp = median(lifeExp))

# A tibble: 5 x 2
continent lifeExp
<fct>       <dbl>
  1 Africa       52.9
2 Americas     72.9
3 Asia         72.4
4 Europe       78.6
5 Oceania      80.7

library("ggplot2")
ggplot(gapminder, aes(x = continent, y = lifeExp)) +
  geom_boxplot(outlier.colour = "hotpink") +
  geom_jitter(position = position_jitter(width = 0.1, height = 0), alpha = 1/4)



##########################################################################################################################

#
gap_with_colors <- 
  data.frame(gapminder,
             cc = I(country_colors[match(gapminder$country,
                                         names(country_colors))]))
#
keepers <- with(gap_with_colors,
                continent %in% c("Africa", "Europe") & year == 2007)
plot(lifeExp ~ gdpPercap, gap_with_colors,
     subset =  keepers, log = "x", pch = 21,
     cex = sqrt(gap_with_colors$pop[keepers]/pi)/1500,
     bg = gap_with_colors$cc[keepers])
     