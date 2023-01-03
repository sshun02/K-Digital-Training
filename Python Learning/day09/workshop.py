ls = []

for i in range(1880, 2016):
    cnt_f = 0
    cnt_m = 0
    file = './DB_work/exam01/yob{}.txt'.format(i)
    with open(file, 'r') as f:
        data = f.readlines()
        for d in data:
            if d[-1] == '\n':
                d = d[-1]

            tmp = d.split(',')
            sex = tmp[1]
            birth = tmp[2]

            if sex == 'F':
                cnt_f += int(birth)
            else:
                cnt_m += int(birth)
    ls.append((y, cnt_f, cnt_m))

with open('birth.csv','w') as f:
    for i, bf, bm, in ls:
        data = '{},{},{}\n'.format(i,bf,bm)
        f.write(data)