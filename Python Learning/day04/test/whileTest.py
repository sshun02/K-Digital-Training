# #while 문은 while 조건식이 False이 될 때 까지 실행문을 반복적으로 수행한다.
#
# '''
# while 조건식:
#     명령;
#
# while 조건식:
#     명령;
#
# else:
#     False명령
# '''
#
# print()
# a = 1
# while a >= 5: # 1 >= 5
#     print(a)
# else:
#     print("False")
#
# print()
#
# x = 1
# sum = 0 # 합을 구하는 변수
#
# while x <= 10:
#     sum += x  #데이터 누적
#     x += 1    #x값 1씩 증가
# print(sum)
i = 1
j = 0
while True:
    if i > 10:
        break
    else:
        print((i,"전째 반복입니다."))
        print("합산한값은",j,"입니다.\n")
        i += 1
        j += i
