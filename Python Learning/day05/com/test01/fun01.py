def m_test(a,b):
    print(f'a={a} b={b}')

def getTest(a,b):
    return a+b

my_getTest = lambda a,b=1 : a+b

if __name__ == '__main__':
    print(getTest(1,2))
    print(my_getTest)