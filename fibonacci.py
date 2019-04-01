## 피보나치 수열
##피보나치 수열의 첫 20개 항을 차례대로 출력하는 프로그램을 써보세요.
## 실행결과
#1
#1
#2
#3
#5
#8
#13
#21
#34
#55
#89
#144
#233
#377
#610
#987
#1597
#2584
#4181
#6765
previous = 0
current = 1
i = 1
while i <= 20:
    print(current)
    temp = previous
    previous = current
    current += temp
    i += 1
