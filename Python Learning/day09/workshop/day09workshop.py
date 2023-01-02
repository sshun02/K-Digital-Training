'''
1. 제공된 데이터를 이용하여 이름, 성별, 출생아 수를 연도별로 계산하는 코드를 작성하시오. 결과를 birth.csv로 작성

for y range(1880,2016):
    FILENAME='경로/yob{}.txt'.format(y)
'''

""

# 1880년부터 2016년까지 loop 회전
for y in range(1880, 2016):
    # 연도 붙여서 filename 정하기
    FILENAME = './DB_work/exam01/yob{}.txt'.format(y)
    # 연도 바뀔대마다 count 0으로 내리기
    female_cnt, male_cnt = 0, 0
    num = 0
    with open(FILENAME, "r") as f:
        # 한번에 파일 전부열기
        lines = f.readlines()
        # 한줄씩 loop
        for line in lines:
            # name, sex, 필요없는 내용 분할해서 변수에 담기
            name, sex, num = line.split(',')
            num += num
            # python 성별 구분해서 count 수 올리기
            if sex == 'F':
                female_cnt += 1
            elif sex == 'M':
                male_cnt += 1
            else:
                pass

    print(f"{y},{male_cnt},{female_cnt}\n")
