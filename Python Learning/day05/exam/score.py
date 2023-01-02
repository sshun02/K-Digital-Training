def getTot(kor, eng, mat):
    tot = kor + eng + mat
    return tot

def getAvg(tot):
    avg = float(tot/3)
    return avg

def getGrad(avg):
    if avg > 90:
        grad = 'A'
    elif avg > 70:
        grad = 'B'
    elif avg > 50:
        grad = 'C'
    else:
        grad = 'F'
    return grad