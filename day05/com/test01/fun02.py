# 람다식
odd_even = lambda x: 'even' if x % 2 == 0 else 'odd'


# 함수
def get_odd_even(x):
    if x % 2 == 0:
        return 'even'
    else:
        return 'odd'


if __name__ == '__main__':
    print(odd_even(4))
    print(get_odd_even(4))
