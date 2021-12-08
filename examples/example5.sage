p = 13556816809365573763
q = 1947095473445800211
e = 454562615750669153749
d = 7607160071080291129
p2 = 13546827679130451968
rho = 0.5
gamma = 0.083712
phi = (p-1)*(q-1)
n = p*q

q2 = n//p2
n2 = n+1-(p2+q2)

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
R = int(n^(rho-gamma))
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
