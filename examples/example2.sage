p = 11691268676806734812183364083
q = 5161104192036123949
e = 217313062367259180263192524848395
d = 27488663851854587
phi = (p-1)*(q-1)
n = p*q

# CF
print('CF:')
fra = (e/n).continued_fraction()
for i in range(len(fra)):
    k = fra.numerator(i)
    d2 = fra.denominator(i)
    
    if d == d2:
      print(i, d2)
print('------')


# Lattice
print('Lattice:')
R = int(2^93)
m = matrix(ZZ, [
  [R, -n],
  [0, e]
])

L = m.LLL(3/4)
w = L[0]

v = m.solve_left(w)
print('v = %s' % v)

print('------')
print('d = %d' % d)
