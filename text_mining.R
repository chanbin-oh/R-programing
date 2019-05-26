##### 11���� �ؽ�Ʈ ���̴�

### 1. ��Ű�� ��ġ �� �ε�

install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

library(KoNLP)
library(dplyr)


### 2. ���� �����ϱ�

useNIADic()

### 3. ������ �ҷ�����

txt <- readLines("hiphop.txt")
head(txt)

### 4. Ư������ �����ϱ�

install.packages("stringr")
library(stringr)

# Ư������ ����
txt <- str_replace_all(txt, "\\W", " ")

##########################################################################################################################

#### ���� ���� ���� �ܾ� �˾ƺ���

### 1. ���� �����ϱ�

extractNoun("���ѹα��� ����� �ѹݵ��� �� �μӵ����� �Ѵ�")

### 2.

# ���翡�� ���� ����

nouns <- extractNoun(txt)

# ������ ���� list�� ���ڿ� ���ͷ� ��ȯ, �ܾ ��ǥ ����
wordcount <- table(unlist(nouns))

# ������ ���������� ��ȯ
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# ������ ����
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

### 3. ���� ���� �ܾ� ��ǥ �����

# �� ���� �̻� �ܾ� ����
df_word <- filter(df_word, nchar(word) >= 2)

#############################################################################################################

#### ���� Ŭ���� �����