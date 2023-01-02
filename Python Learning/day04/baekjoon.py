# N = int(input())
# X = list(input())
#
# X_sum = 0
# for i in range(N):
#     X_sum += int(X[i])
# print(X_sum)

# ************************************************************************

# 알파벳 소문자로만 이루어진 단어 S가 주어진다.
# 각의 알파벳에 대해서, 단어에 포함되어 있는 경우에는 처음 등장하는 위치를, 포함되어 있지 않은 경우에는 -1을 출력하는 프로그램을 작성하시오.

# S = list(input())
# abc = 'abcdefghijklmnopqrstuvwxyz'
#
# for i in abc:
#     if i in S:
#         print(S.index(i), end=' ')
#     else:
#         print(-1, end=' ')


# n = list(map(int, input().split()))
# def SUM(suma):
#     a = sum(suma)
#     return a
# print(SUM(n))


# 셀프 넘버
# nt_num = set(range(1, 10001))
# gr_num = set()
# new_num = 0
# for i in range(len(nt_num)):
#     for j in str(i):
#         i += int(j)
#     gr_num.add(i)
#
# self_num = sorted(nt_num - gr_num)
# for i in self_num:
#     print(i)


# N = int(input())
# for i in range(N):
#     num, s = input().split()
#     text = ''
#     for k in s:
#         text += int(num)*k
#     print(text)

#알파벳 대소문자로 된 단어가 주어지면, 이 단어에서 가장 많이 사용된 알파벳이 무엇인지 알아내는 프로그램을 작성하시오.
#단, 대문자와 소문자를 구분하지 않는다.

# word = input().lower()
# list_word = list(set(word))
# cnt = []
#
# for i in list_word:
#     count = word.count(i)
#     cnt.append(count)
#
# if cnt.count(max(cnt)) >= 2:
#     print("?")
# else:
#     print(list_word[(cnt.index(max(cnt)))].upper())

#단어갯수찾기
# print(len(input().split()))

#숫자 역순 출력
# a, b = list(input().split())
#
# a_ch = int(a[::-1])        ##num1 = int(num1[::-1])  # [::-1] : 역순
# b_ch = int(b[2] + b[1] + b[0])    ##num2 = int(num2[::-1])
#
#
# if a_ch > b_ch:
#     print(a_ch)
# else:
#     print(b_ch)

dial = ['ABC','DEF','GHI','JKL','MNO','PQRS','TUV','WXYZ']
word = list(input())
ret = 0
for i in range(len(word)):
    for j in dial:
        if word[i] in j:
            ret += dial.index(j)+3
print(ret)




