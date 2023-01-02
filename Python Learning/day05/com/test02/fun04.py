def My_Read(file):
    with open(file, mode='r') as f:
        print(f.read())

def My_ReadLines(file):
    with open(file, mode='r') as f:
        print(f.readlines())

def My_ReadLines02(file):   # \n을 제거하는 방법
    with open(file, mode='r') as f:
        r_str = [s.strip() for s in f.readlines()]
        print(r_str)

if __name__ == '__main__':
    My_Read('b.txt')
    print("----------------")
    My_ReadLines('b.txt')
    print("----------------")
    My_ReadLines02('b.txt')