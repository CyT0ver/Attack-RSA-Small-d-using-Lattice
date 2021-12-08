p = 7010690394300496153
q = 5662462476069981011
e = 388452861963165789401
d = 13387488027727273721
a = 21
b = 26
phi = (p-1)*(q-1)
n = p*q

alpha = log((a*p-b*q).abs()*2, n)*2
print('alpha = %f' % alpha.n(100))
n2 = int(n+1-((b/a)^(1/2)+(a/b)^(1/2))*n^(1/2))

# CF
print('CF:')
fra = (e/n2).continued_fraction()
for i in range(len(fra)):
    k = fra.numerator(i)
    d2 = fra.denominator(i)
    
    if d == d2:
      print(i, d2)
print('------')


# Lattice
print('Lattice:')
R = int(n^(alpha/2))
m = matrix(ZZ, [
  [R, -n2],
  [0, e]
])

L = m.LLL(3/4)
w = L[0]

v = m.solve_left(w)
print('v = %s' % v)

print('------')
print('d = %d' % d)
