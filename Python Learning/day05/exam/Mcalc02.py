hap = lambda  a,b : a + b
Sub = lambda  a,b : a - b
Mul = lambda  a,b : a * b
Div = lambda  a,b : a / b



if __name__ == '__main__':

    a = 100
    b = 50

    print(f'{a} + {b} = {hap(a, b)}\n')
    print(f'{a} - {b} = {Sub(a, b)}\n')
    print(f'{a} * {b} = {Mul(a, b)}\n')
    print(f'{a} / {b} = {Div(a, b)}\n')