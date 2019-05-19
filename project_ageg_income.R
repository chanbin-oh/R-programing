##### 09 - 4 연령대에 따른 월급차이

#### part1. 변수 검토 및 전처리

### 1. 나이 변수 전처리

welfare <- welfare %>%
  mutate(ageg = ifelse(age <30, "young",
                       ifelse(age <= 59, "middle", "old")))

         
table(welfare$ageg)

middle    old  young 
5702   7126   3836 

#### part2. 변수 간 관계 분석

### 1. 연령대에 따른 월급 차이 분석하기

ageg_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income = mean(income))

ageg_income

# A tibble: 3 x 2
ageg   mean_income
<chr>        <dbl>
  1 middle        277.
2 old           163.
3 young         134.

### 2. 그래프 만들기
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))
