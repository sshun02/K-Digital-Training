
# < 리스트 객체릐 인덱스 값 리턴 / ord(), chr() 시각화 >

import  matplotlib.pyplot as plt
# print("1. 1~10까지 출력해보자.")
# for i in range(1, 11):
#     print("%d" % i, end='\t')
#
#
# print()
#
# print(("2. 10~1 까지 출력해보자"))
# for i in range(10, 0 , -1):
#     print("%d" %i, end='\t')

# print("2. 일반 for문을 이용해서 값을 출력해보자")
# my_list = ['멍멍이' ,'야옹이', '짹짹이']
# for w in my_list:
#     print(w, len(w))
#
# print(my_list[0][0])
# print(my_list[1])
# print(my_list[2])
#
#
# print("1-1. 번외편")
# my_list = ['멍멍이' ,'야옹이', '짹짹이']
# for w in my_list:
#     print(w, len(w))
#
# print(my_list[0][0])
# print(my_list[1][2])
# print(my_list[2])

print("3. for문을 이용하여 값을 축력 해보자. 영문자출력의 연습")
print("\n 영소문자로 이루어진 글자중에서 각 문자의 빈도를 알고싶다.")
#word = "Python is an easy to learn, powerful programming language. It has efficient high-level data structures and a simple but effective approach to object-oriented programming"
word = "pythonisaneasytolevelobject"
print(ord('a'))

h_res = [0]*26
for c in word:
    h_res[ord(c) - ord('a')] += 1
print(h_res)

#plt.plot(h_res)  # 그래프 그린다. line2D 그래프
#plt.show()  # 그래프 표시

print("4. for문을 이용하여 값과 개체를 출력할 수 있는 구문 시각화 해 보자. 영문자 출력의 연습")
print("\n 영소문자로 이루어 진 글자 중에서 각 문자의 빈도를 알고 싶다.")

left = list(range(26)) #0~25
labels = [chr(i + ord('a')) for i in range(26)]
plt.bar(left,h_res,tick_label=labels)
plt.show()









