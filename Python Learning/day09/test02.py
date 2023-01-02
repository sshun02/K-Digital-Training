# class My:
#     def __new__(cls, *args, **kwargs):  # 메모리에 로드 1번
#         print('~~~new~~~') #스스로 객체 생성을 할 때 재정의로 사용된다.
#     def __init__(self):
#         print('~~~int~~~')
#
# if __name__ == '__main__':
#     print(My())   #object.__str__     new -> init
#     print(dir(My))

def wraaper(func):
    def wrappped_func():
        print('before')
        func()
        print('after')
    return wrappped_func()

def myfunc():
    print('I am here')

myfunc()
myfunc = wraaper(myfunc)
myfunc()