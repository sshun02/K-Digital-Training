#
# N = int(input("0에서 99사이의 수를 입력하세요 : "))
#
# N_1 = N
#
# cnt = 0
#
# while True:
#     sum_N = (N // 10) + (N % 10)
#     new_N = ((N % 10) * 10) + (sum_N % 10)
#     cnt += 1
#
#     if new_N == N_1:
#         break
#     N = new_N
# print(cnt)



class Human():
    #         Human information
    def __init__(self, name, age, tall):  # 생성자
        self._name = name
        self._age = age
        self._tall = tall

    def tall_age(self, tall, age):
        return tall+age

person1 = Human('David', 28, 170)

print(person1)  # <__main__.Human object at 0x000001E59200EDA0>
print(person1._name)  # person1's name print >> David
print(person1._tall)
print(person1.tall_age(28, 170))
print(id(3))


