# 내장함수를 이용한 매개인자를 활용 해 보자.
# sorted(iterable, /, *, key = None, reverse = False)
'''
max(...)
    max(iterable, *[, default=obj, key=func]) -> value
    max(arg1, arg2, *arg *[, ket=func _>value

min(...)
    min(iterable *[, default = obj
'''

if __name__ == '__main__':
    print(sorted([11, 24, 3, 4], reverse=True))  # reverse=False=오름차순  /   True=내림차순
    print(sorted(['오늘은', '불금', '3', '4', '신난당'], reverse=True))
    print(sorted(['오늘은', '불금', '3', '4', '신난당'], reverse=False))
    print(sorted(['가나하', '가다다'], reverse=True))
    print('============================[ 1. sorted 함수 key값 지정]==========================')
    print(sorted(['오늘은99999999', '불금', '3', '4', '신난당'], reverse=True, key=len))
    print(len('오늘은99999999'))

    print('============================[ 2. sorted 함수 key값 람다 지정]==========================')
    print(sorted(['오늘은99999999', '불금', '388', '477', '신난당'], key=lambda x: x[1]))
    print((lambda x: x[1])('오늘은99999999'))  # 문자열의 1번지 인덱스 값을 리턴받는다.
    print(sorted(['가나하111', '가가다'], reverse=False))
    print(sorted(['가가하13', '가가다'], key=lambda x: x[2]))

    print('============================[ 3. max 함수 key값 람다 지정]======================================')
    # max(interable, *[, default = obj, key = func])
    print(max([3, 4, 5, 2, 100, 36, 7, 8], key=lambda x: x if x < 6 else 0))
    print(max(['3', '4', '5', 6, 7], key=str))
    print(max(['3', '4', '5', 6, 7], key=int))
