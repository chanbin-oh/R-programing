##### 09 - 4 ���ɴ뿡 ���� ��������

#### part1. ���� ���� �� ��ó��

### 1. ���� ���� ��ó��

welfare <- welfare %>%
  mutate(ageg = ifelse(age <30, "young",
                       ifelse(age <= 59, "middle", "old")))

         
table(welfare$ageg)

middle    old  young 
5702   7126   3836 

#### part2. ���� �� ���� �м�

### 1. ���ɴ뿡 ���� ���� ���� �м��ϱ�

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

### 2. �׷��� �����
ggplot(data = ageg_income, aes(x = ageg, y = mean_income)) + geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))