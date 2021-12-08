p = 6212434253312289161
q = 7705371143963067067
e = 6919054782499191497
d = 6918446685856378313
phi = (p-1)*(q-1)
n = p*q

# CF
print('CF:')
fra = (e/n).continued_fraction()
for i in range(len(fra)):
    k = fra.numerator(i)
    d2 = fra.denominator(i)
    
    for j in range(10):
      if d+j == d2:
        print(i, d2, j)
print('------')


# Lattice
print('Lattice:')
R = 2^62
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
