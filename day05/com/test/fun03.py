#인수, 매개인자 사용법 << 매개인자에 기본값을 가진 함수 >>

#매개 변수 앞에 * (args_복수값의 튜플을 받겠다.), **(kwargs_dict로 받겠다.) 키워드를 선언
def my_fun(a,b=50,c=100): # 매개인자의 기본값을 지정하고 있지 않은 매개인자 이전에 놓으면 에러가 발생한다.
    print(f'a={a} b={b} c={c}')

def my_fun01(*args): # * 모든 (0 or more)
    print(f'a={args}')

def my_fun02(**kwargs): # * 모든 (0 or more)
    print(f'a={kwargs}')

def my_test(a, b, *args, **kwargs): # 순서가 중요하다. 기본 -> 복수값튜플 -> 딕셔너리
    print(f'{a} {b} {args} {kwargs}')

if __name__ == '__main__':
    my_fun(1,2,c=3)
    my_fun(1,c=2,b=3)
    my_fun(1,2,7777)
    my_fun01(1,2,3,4,5)
    my_fun02(a=1,b=2,c=3,d=4,e=5)
    my_test(1,2,3,4,5,6,z=1,k=2,c=3)


