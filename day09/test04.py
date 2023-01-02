import pprint
import inspect
class A:
    pass
class B(A):
    pass
class C(B):
    pass
class D(C):
    pass

if __name__ == '__main__':
    print(dir(A))
    print(D.mro())  # 역순으로 탐색
    print(issubclass(D, B))
    print(D.__bases__)
    r = D()
    print(r.__class__.__name__)
    print('---------------------------------')
    pp = pprint.PrettyPrinter(indent=4)
    pp.pprint(inspect.getclasstree([C]))


