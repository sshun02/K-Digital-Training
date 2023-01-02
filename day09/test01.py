# var = 100 # 전역
#
# def f(a, b):
#     c = 10
#     var = 7777 # 지역
#     #print(locals(), globals())
#     print(locals(), var)
#
# class My:
#     def f(self, a, b):
#         self.c = 101
#         var = 5555  # 지역
#         # print(locals(), globals())
#         print(locals(), var)
#
#
# if __name__ == '__main__':
#     My().f(1,2)
#     print(var)   # 전역
#     print(My.__dict__)
#     print(dir(My))

# import binascii
#
# binascii.hexlify(b'abc')
# buf = bytearray(b'abcde')
# binascii.hexlify(buf)
# binascii.unhexlify(b'6162636465')
# print(buf)
# print(binascii)
# print(binascii.hexlify)

# from functools import partial
#
# bin2int = partial(int, base=2)
# bin2int('1001')
#
#
# def quadratic(x, a, b, c):
#     return a * x * x + b * x + c
#
#
# f1 = partial(quadratic, a=3, b=-4, c=5)
# f1(0.1)

import sys
import numpy

numpy.test
(sys.modules)
('\n'.j기oin(sys.modules.keys()))
