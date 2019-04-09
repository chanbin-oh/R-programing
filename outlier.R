### 07-2 이상한 데이터를 찾아라 - 이상치 정제하기.
## 이상치 제거하기
# 이상치가 포함된 데이터 생성
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier
#
# 이상치 확인하기
table(outlier$sex)
table(outlier$score)
#
# 결측 처리하기
#
# score의 이상치 NA로 표시하기
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
#
# sex, score 변수 모두 이상치를 결측치로 변환했으므로, 결측치만을 제외한다.
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))
