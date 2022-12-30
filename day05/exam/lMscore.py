import lscore as lm

name = input('input name : ')
kor = int(input('input kor : '))
eng = int(input('input eng : '))
mat = int(input('input mat : '))

tot = kor+eng+mat
avg = tot/3

lm.LambdaAdd(kor, eng, mat)
lm.LambdaAvg(tot)
lm.LambdaGrad(avg)