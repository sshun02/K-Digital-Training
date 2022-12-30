def getA():
    res = 100  # 함수 안에 선언하는 변수 -> **지역변수**
    return res    # return = 함수를 종료하는 명령어

def getB():
    B_list = [1,2,3,4,5]
    return B_list

def getC():
    return '삼성멀티 캠퍼스'

def getD():
    return 97.9

def getE():
    return (1,2,3,4,5)


if __name__ == '__main__':  ## 메인 호출
    int_a = getA()
    print(int_a)  # 100
    print(getA())  # 100

    float_b = getB()
    print(float_b)

    float_b = getC()
    print(float_b)

    float_b = getD()
    print(float_b)

    float_b = getE()
    print(float_b)

    print(type(getA()))  #  ->  print(type(100))
    print(type(getB()))  #  ->  print(type([1,2,3,4,5])))
    print(type(getC()))  #  ->  print(type('멀티삼성 캠퍼스'))
    print(type(getD()))  #  ->  print(type(90.7))
    print(type(getE()))  #  ->  print(type((1,2,3,4,5)))