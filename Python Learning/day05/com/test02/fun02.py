# 파일 입출력 + 인코딩
import locale
# with ~as --> with 명령 as 별칭
def My_Write(file, content):
    with open(file, mode='w') as f :
        f.write(content)


def My_Read(file):
    with open(file, mode='r') as f :
        print(f.read())


# def My_Write(file, content):
#     f = open(file, mode='w')
#     f.write(content)
#     f.close()
#
#
# def My_Read(file):
#     f = open(file, mode='r')
#     r = f.read()
#     print(r)
#     f.close()


if __name__ == '__main__':
    My_Write('b.txt', '1234539999\t123123\n123123\n')
    My_Read('b.txt')
    print('인코딩 확인 현재 플랫폼 : ' ,locale.getpreferredencoding())

    # res =open('a.txt', mode ='r' )
    # print(res, type(res) )
    #
    # res02 = open('b.txt', mode='w')
    # res02.write('asdfsdfsaf')
    # res02.write('999999\t123123\n123123\n')
    # res02.close()
    # print(res02, type(res02))
    #
    #
    # res03 = open('b.txt', mode = 'r')
    # print((res03.read()))
    # res03.close()

    # res03 = open('c.gif', mode='wb')
    # print(res, type(res))
    #
    # res04 = open('d.jpg', mode='b+w')
    # print(res02, type(res02))
    #
    # print(dir(io))
