def numTest(x):
    assert x.isdigit(), "x is a number!"
    print("Input number is: " +str(x))


if __name__ == '__main__':
    print("Please input number:")
    num = input()
    numTest(num)