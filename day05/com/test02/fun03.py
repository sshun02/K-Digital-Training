def My_Read(file):
    with open(file, mode='r') as f:
        print(f.read())


def My_ReadLine(file):
    with open(file, mode='r') as f:
        for r_str in f:
            print(r_str)

def My_ReadLine02(file):
    with open(file, mode='r') as f:
        while True:
            r_str = f.readline()
            print(r_str)
            if not r_str:
                break


if __name__ == '__main__':
    My_Read('b.txt')
    print("----------------")
    My_ReadLine('b.txt')
    print("----------------")
    My_ReadLine02('b.txt')