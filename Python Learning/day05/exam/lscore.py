def LambdaAdd(kor, eng, mat):
    LambdaAdd = (lambda x,y,z: x+y+z)
    print('총점은 : ',lambdaAdd(kor,eng,mat))

def LambdaAvg(tot):
    LambdaAvg = (lambda x: x / 3)
    print('평균은 : ',LambdaAvg(tot))

def LambdaGrad(avg):
    LambdaGrad = (lambda x : 'A' if x > 90 else ('B' if x > 70 else 'C') if x > 50 else 'F')
    print('학점은 : ',LambdaGrad(avg))
