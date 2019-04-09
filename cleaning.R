### �ش�ġ�� �̻�ġ �����ϱ�
## 07-1 ���� �����͸� ã�ƶ�! - ����ġ �����ϱ�
# ����ġ ã��
df <- data.frame(sex = c("M", "F", NA, "M", "F"),
                 score = c(5, 4, 3, 4, NA))
df
# ������
# - ���ڷ� ������ ������ NA�� <>�� ������ ���·� ��µ�.
# - NA �յڿ��� �����ǥ�� ����. ����ǥ�� ������ ����ġ�� �ƴ϶� ������ "NA"�� �ǹ�

is.na(df)                                       # ����ġ Ȯ��

table(is.na(df))                                # ����ġ �� ���
 
table(is.na(df$sex))                            # sex ����ġ �� ���

table(is.na(df$score))                          # score ����ġ �� ���

mean(df$score)

sum(df$score)

# ����ġ �����ϱ�
library(dplyr)                            # dplyr ��Ű�� �ε�

df %>% filter(is.na(score))               # score�� NA���� �����͸� ���
   
df %>% filter(!is.na(score))              # score ����ġ ����

df_nomiss <- df %>% filter(!is.na(score)) # score ����ġ ���Ÿ� ������ �Ҵ�

mean(df_nomiss$score)                     # score ��� ����

sum(df_nomiss$score)                      # score �հ� ����

df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex)) # ���� ���� ���ÿ� ����ġ ���� ������ �����ϱ�

df_nomiss

# ����ġ�� �ϳ��� ������ �����ϴ� ���
# �տ��� filter()���� ������ ������ �����ؼ� �����ϴ� ���̴�. ��, ����ġ�� ��� �ִ��� ������ Ȯ���ؾ���.
# na.omit()�� �̿��ϸ� ������ �������� �ʰ� ����ġ�� �ִ� ���� �ѹ��� ������ �� �ִ�.

df_nomiss2 <- na.omit(df)                # ��� ������ ����ġ ���� ������ ��
df_nomiss2

# ������
# - na.omit()�� ����ġ�� �ϳ��� ������ ��� �����ϱ� ������ ������ ������ ������, �м��� �ʿ��� ����� �սǵǴ� ����.
# - �׷��Ƿ� filter()�� Ȱ���ؼ� �м��� �ʿ��� �ڷḸ ��� ���ִ� ���� ��õ.


# �Լ��� ����ġ ���� ��� �̿��ϱ�
# na.rm �Ķ���� ����غ���.

mean(df$score, na.rm = T)                    # ����ġ �����ϰ� ��� ��
sum(df$score, na.rm = T)                     # ����ġ �����ϰ� �հ� ��

# summarise()�� �̿��ؼ� �����跮�� ������ ���� na.rm�� ������ �� �ִ�.
df_exam[c(2,4,6), "math"] <- NA

df_exam

df_exam %>% summarise(mean_math = mean(math))  # math ��ջ���

# math ����ġ �����ϰ�  ��� ����
df_exam %>% summarise(mean_math = mean(math,na.rm = T))
## mean()�Լ��Ӹ� �ƴ϶� �ٸ� ��ġ���� �Լ��� na.rm�� ���� -> �����跮 �Լ��� ����


## ����ġ ��ü�ϱ�
# ��հ����� ��ü��
mean(df_exam$math, na.rm = T)    # ����ġ �����ϰ� math ��� ����

# ifelse()�Լ��� ����ġ �����ϱ�
df_exam$math <- ifelse(is.na(df_exam$math), 55 ,df_exam$math)
table(is.na(df_exam$math))
df_exam