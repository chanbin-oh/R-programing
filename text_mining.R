##### 11주차 텍스트 마이닝

### 1. 패키지 설치 및 로드

install.packages("rJava")
install.packages("memoise")
install.packages("KoNLP")

library(KoNLP)
library(dplyr)


### 2. 사전 설정하기

useNIADic()

### 3. 데이터 불러오기

txt <- readLines("hiphop.txt")
head(txt)

### 4. 특수문자 제거하기

install.packages("stringr")
library(stringr)

# 특수문자 제거
txt <- str_replace_all(txt, "\\W", " ")

##########################################################################################################################

#### 가장 많이 사용된 단어 알아보기

### 1. 명사 추출하기

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

### 2.

# 가사에서 명사 추출

nouns <- extractNoun(txt)

# 추출한 명사 list를 문자열 벡터로 변환, 단어별 빈도표 생성
wordcount <- table(unlist(nouns))

# 데이터 프레임으로 변환
df_word <- as.data.frame(wordcount, stringsAsFactors = F)

# 변수명 수정
df_word <- rename(df_word,
                  word = Var1,
                  freq = Freq)

### 3. 자주 사용된 단어 빈도표 만들기

# 두 글자 이상 단어 추출
df_word <- filter(df_word, nchar(word) >= 2)

#############################################################################################################

#### 워드 클라우드 만들기
