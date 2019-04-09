### 07-2 �̻��� �����͸� ã�ƶ� - �̻�ġ �����ϱ�.
## �̻�ġ �����ϱ�
# �̻�ġ�� ���Ե� ������ ����
outlier <- data.frame(sex = c(1, 2, 1, 3, 2, 1),
                      score = c(5, 4, 3, 4, 2, 6))
outlier
#
# �̻�ġ Ȯ���ϱ�
table(outlier$sex)
table(outlier$score)
#
# ���� ó���ϱ�
#
# score�� �̻�ġ NA�� ǥ���ϱ�
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier
#
# sex, score ���� ��� �̻�ġ�� ����ġ�� ��ȯ�����Ƿ�, ����ġ���� �����Ѵ�.
outlier %>%
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score))