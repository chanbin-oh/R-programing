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

[1] "\"보고 싶다"                  "이렇게 말하니까 더 보고 싶다" "너희 사진을 보고 있어도"      "보고 싶다"                   
[5] "너무 야속한 시간"             "나는 우리가 밉다" 


### 4. 특수문자 제거하기

install.packages("stringr")
library(stringr)

# 특수문자 제거
txt <- str_replace_all(txt, "\\W", " ")

##########################################################################################################################

#### 가장 많이 사용된 단어 알아보기

### 1. 명사 추출하기

extractNoun("대한민국의 영토는 한반도와 그 부속도서로 한다")

[1] "대한"     "민국"     "영토"     "한반도와" "부속도서" "한"

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

### 1. 패키지 준비하기
# 패키지 설치
install.packages("wordcloud")

# 패키지 로드
library(wordcloud)
library(RColorBrewer)


### 2. 단어 색상 목록 만들기

# Dark2 색상 목록에서 8개 색상 추출
pal <- brewer.pal(8, "Dark2")

### 3. 난수 고정하기

set.seed(1234)

### 4. 워드 클라우드 만들기

wordcloud(words = df_word$word,
          freq = df_word$freq,
          min.freq = 2,
          max.words = 200,
          random.order = F,
          rot.per = .1,
          scale = c(4, 0.3),
          colors = pal)
