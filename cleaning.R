### 극단치와 이상치 제거하기
## 07-1 빠진 데이터를 찾아라! - 결측치 정제하기
# 결측치 찾기
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df
# 유의점
# - 문자로 구성된 변수는 NA가 <>에 감싸진 형태로 출력됨.
# - NA 앞뒤에는 겹따옴표가 없다. 따옴표가 있으면 결측치가 아니라 영문자 "NA"를 의미

is.na(df)                                       # 결측치 확인

table(is.na(df))                                # 결측치 빈도 출력
 
table(is.na(df$sex))                            # sex 결측치 빈도 출력

table(is.na(df$score))                          # score 결측치 빈도 출력

mean(df$score)

sum(df$score)

# 결측치 제거하기
library(dplyr)                            # dplyr 패키지 로드

df %>% filter(is.na(score))               # score가 NA인지 데이터만 출력
   
df %>% filter(!is.na(score))              # score 결측치 제거

df_nomiss <- df %>% filter(!is.na(score)) # score 결측치 제거를 변수에 할당

mean(df_nomiss$score)                     # score 평균 산출

sum(df_nomiss$score)                      # score 합계 산출

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex)) # 여러 변수 동시에 결측치 없는 데이터 추출하기

df_nomiss

# 결측치가 하나라도 있으면 제거하는 방법
# 앞에서 filter()에는 일일이 변수를 지정해서 삭제하는 것이다. 즉, 결측치가 어디에 있는지 일일이 확인해야함.
# na.omit()을 이용하면 변수를 지정하지 않고 결측치가 있는 행을 한번에 제거할 수 있다.

df_nomiss2 <- na.omit(df)                # 모든 변수에 결측치 없는 데이터 추
df_nomiss2

# 유의점
# - na.omit()은 결측치가 하나라도 있으면 모두 제거하기 떄문에 간편한 측면이 있지만, 분석에 필요한 행까지 손실되는 장점.
# - 그러므로 filter()를 활용해서 분석에 필요한 자료만 골라서 없애는 것을 추천.


# 함수의 결측치 제외 기능 이용하기
# na.rm 파라미터 사용해보기.

mean(df$score, na.rm = T)                    # 결측치 제외하고 평균 산
sum(df$score, na.rm = T)                     # 결측치 제외하고 합계 산

# summarise()를 이용해서 요약통계량을 산출할 때도 na.rm을 적용할 수 있다.
df_exam[c(2,4,6), "math"] <- NA

df_exam

df_exam %>% summarise(mean_math = mean(math))  # math 평균산출

# math 결측치 제외하고  평균 산출
df_exam %>% summarise(mean_math = mean(math,na.rm = T))
## mean()함수뿐만 아니라 다른 수치연산 함수도 na.rm을 지원 -> 요약통계량 함수도 가능


## 결측치 대체하기
# 평균값으로 대체하
mean(df_exam$math, na.rm = T)    # 결측치 제외하고 math 평균 산출

# ifelse()함수로 결측치 제외하기
df_exam$math <- ifelse(is.na(df_exam$math), 55 ,df_exam$math)
table(is.na(df_exam$math))
df_exam