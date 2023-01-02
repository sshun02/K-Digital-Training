# def trace(func):  # 호출할 함수를 매개변수로 받음
#     def wrapper():  # 호출할 함수를 감싸는 함수
#         print(func.__name__, '함수 시작')  # __name__으로 함수 이름 출력
#         func()  # 매개변수로 받은 함수를 호출
#         print(func.__name__, '함수 끝')
#
#     return wrapper  # wrapper 함수 반환
#
# def hello():
#     print('hello')
#
# def world():
#     print('world')
#
# trace_hello = trace(hello)    # 데코레이터에 호출할 함수를 넣음
# trace_hello()                 # 반환된 함수를 호출
# trace_world = trace(world)    # 데코레이터에 호출할 함수를 넣음
# trace_world()                 # 반환된 함수를 호출

def m_discount(product, discount):
    price = int (product['price'] * (1.0 - discount))
    assert 0 <= price <= product['price']
    return price



if __name__ == '__main__':
    shoes = {'name' : 'Fancy Shoes', 'price': 14900}
    print(m_discount(shoes, 0.25))
    print(m_discount(shoes, 1.1))       # 잘못된 할인율은 AssertionError로 종료되게 만든다
