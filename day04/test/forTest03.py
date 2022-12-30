# [] 구문을 함축해서 사용 -> 리스트 함축문, 리스트 내포문

m = [1,2,3,4,5,6,7,8,9,10]

print(m)
print()
#해석을 거꾸로 하면 이해하기 쉽다.
m_2 = [i*2 for i in m]
print(m_2)
print()

m_3 = [i*3 for i in m]
print(m_3)
print()

print("m의 값 중에 짝수만 출력 해보자. 조건은 뒤에.")
res = [ i for i in m if (i % 2) == 0]
print(res)

print("\n m의 값 중으로 이중 for를 구현해보자")
res_mul = [ i*j for i in m for j in m]
print(res_mul)

print("\n for로 구구단을 구현해보자")
res_gugu = [i*j for i in range(2,10) for j in range(1,10)]
print(res_gugu)