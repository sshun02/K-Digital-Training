#*********************************상속*****************************
# # delegation.py
# class Delegation:
#     def __init__(self, data):
#         self.stack = data
#
#     def __getattr__(self, name):
#         print('Delegation {} '.format(name), end=' ')
#
#     return getattr(self.stack, name)  # self.stack의 속성을 대신 이용
#
#
# a = Delegation([1, 2, 3, 1, 5])
# print(a.pop())
# print(a.count(1))

class Test:
    def __init__(self, t):
        self.t = t

    def __getattr__(self, item): # 인덱싱 슬라이싱을 하는 클래스의 맴버 기능을 확인하고 싶을 때 사용
        print('-------', item)   # __getattribute__
        return getattr(self.t, item)

if __name__ == '__main__':
    res = Test([1,2,3,4,1,1,5,15])
    print(res)
    print(res.count(1))
    print(res.pop(7))

    #어떨 떄 어떤 메소드가 실행되는지 알고 싶을 때 사용한다.

    