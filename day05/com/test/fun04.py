def my_Fun(a,b,c):
    print(f'a={a}, b={b}, c={c}')



if __name__ == '__main__':
    my_Fun(1,2,c=3)
    my_list = [11,22,33]
    my_Fun(*my_list)    # 튜플이나 리스트 객체에 *를 붙이면 위치 매개 인자로 간주한다.
    my_dict = {'a':100, 'b':200, 'c':300}
    my_Fun(**my_dict)

