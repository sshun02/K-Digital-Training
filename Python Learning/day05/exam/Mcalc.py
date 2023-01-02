import exam.calc as ca

if __name__ == '__main__':
    print('모듈 경로를 확인 :', ca)
    print('목록울 확인 :', dir())
    print(" calc 목록을 확인 : ", dir(ca))
    print(ca.__file__, type(ca.__file__))
    print('모듈의 name =', ca.__name__)
    print(ca.__package__)

    a = 100
    b = 50

    print(f'{a} + {b} = {ca.getHap(a, b)}\n')
    print(f'{a} - {b} = {ca.getSub(a, b)}\n')
    print(f'{a} * {b} = {ca.getMul(a, b)}\n')
    print(f'{a} / {b} = {ca.getDiv(a, b)}\n')
