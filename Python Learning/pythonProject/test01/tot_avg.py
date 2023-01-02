#
# import random
# import numpy as np
#
# np.zeros(10)
#
# for i in range(2, 10):
#     for k in range(1, 10):
#         print("%d * %d = %d" % (i, k, i * k))
#
# a = []
#
# for i in range(20):
#     a.append(random.randint(1, 100))
# print(a)


kor = int(input('input kor : '))
eng = int(input('input eng : '))
mat = int(input('input mat : '))

tot = kor+eng+mat
avg = tot / 3

if avg >= 90:
    print("A학점")
elif avg >= 80:
    print("B학점")
else:
    print("F학점")
