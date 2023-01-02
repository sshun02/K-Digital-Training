# 함수는 call by __ 불러오면 무언가를 리턴해준다.
def My_Fun(name):
    print(f"이름은 {name} 이다.")


def U_Fun():
    print('1 2 3 4 5')

def My_Sum(kor,eng,mat):
    tot = kor + eng + mat
    print(f"tot = {tot}")

if __name__ == '__main__':  # 메인 호출

    My_Sum(90,100,100)

