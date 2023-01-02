def mytest(res):  # @호출되는 데코레이션
    def prn():    # 수행명령을 구현하는 함수
        res()     # 매개인자로 받은 함수
    return prn    # 수행 후 수행 명령 함수를 리턴

@mytest
def my_prn():
    print('exam')

if __name__ == '__main__':
    my_res = mytest(my_prn)
    my_res()
    print(my_res)