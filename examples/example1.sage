p = 7771159731609483211
q = 2947386503237666051
e = 722262311366174354989
d = 158561584531008409
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
R = 2^64
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
