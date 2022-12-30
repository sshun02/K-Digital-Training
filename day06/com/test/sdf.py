#
# class My:
#     def __init__(self):
#         print("명시 생성자")
#
#     '''
#     def __del(self)__:
#         print("명시 소멸자")
#     '''
# class U:
#     def __del__(self):   #객체를 소멸하는 메소드를 재정의하게 되면 명시된 소멸자가 호출되며 객체가 소멸된다.
#         print("U 명시 소멸자")
#
# if __name__ == '__main__':
#     print(dir(U))
#
#     m1 = My()  # __init__호출 -> 명시 생성자 호출
#     u1 = U()   # __init__호출 -> 기본 생성자 호출
#
#     print(dir())
#     del u1     # 전역으로 선언 된 내장 명령어이다. 생성된 객체 소멸
#     print(dir())


#staticmethod
class hello:

    def __init__(self):
        self.a = 10
        self.b = 20
        self.c = 30
    def change(self):
        self.a = 1010
k = hello()
print(k.a, k.b, k.c)
k.change()
print(k.a, k.b, k.c)
