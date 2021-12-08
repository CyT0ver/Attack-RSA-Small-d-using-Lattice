p = 16634746592804413571
q = 5904115439904173963
e = 28616917559186953
d = 3432007098400442548397
phi = (p-1)*(q-1)
n = p*q

# CF
print('CF:')

# debug.
bound = 0.4
bits = 64
j_bound = int(2^(bits*2*(1/2-bound)))
fra = (e/n).continued_fraction()
print('[Debug] j_bound = %d' % j_bound)
# .debug

for i in range(len(fra)):
    k = fra.numerator(i)
    d2 = fra.denominator(i)
    
    for j in range(j_bound):
      if d2-j == d:
        print(i, d2, j)
print('------')

    
# Lattices
print('Lattice:')
R = 2^54
m = matrix(ZZ, [
  [R, -n],
  [0, e]
])
L = m.LLL(3/4)
w = L[0]
v = m.solve_left(w)
print('v = %s; %d' % (v, v[1]-d))

print('------')
print('d = %d' % d)


