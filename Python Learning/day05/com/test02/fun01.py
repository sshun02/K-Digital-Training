# << 고차함수 : 매개인자를 가지는 함수 >>
#map(func, *iterables),
# filter(function or None, iterable) --> filter object


if __name__ == '__main__':
    print(list(map(lambda x : x**2, range(1, 10))))  # 요소를 인덱스 순으로 입력 받아 연산한 결과를 전체리턴
    print(list(filter(lambda x: x % 2 == 0, range(1, 10))))
    x = list(map(int, input().split()))
    print(x)