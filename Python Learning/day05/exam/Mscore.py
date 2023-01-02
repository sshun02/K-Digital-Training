import score as sc

name = input('input name : ')
kor = int(input('input kor : '))
eng = int(input('input eng : '))
mat = int(input('input mat : '))

tot = sc.getTot(kor, eng, mat)
avg = sc.getAvg(tot)
grad = sc.getGrad(avg)

print('이름 : ', name)
print('국어, 영어, 수학 :', kor, eng, mat)
print('총점, 평균, 학점:', tot, avg, grad)
