{w: 1 for w in 'abc'}
a1 = 'abcd'
a2 = (1, 2, 3, 4)
{x: y for x, y in zip(a1, a2)}
{w: k for k, w in [(1, 'one'), (2, 'two'), (3, 'three')]}
{w: k + 1 for k, w in enumerate(['one', 'two', 'three'])}
d = {'one': 1, 'two': 2, 'three': 3}
{v: k for k, v in d.items()}
{(k, v): k + v for k in range(3) for v in range(3)}
