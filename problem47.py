def trial_division(n, bound=None):
  if n == 1: return 1
  for p in [2, 3, 5]:
    if n%p == 0: return p
  if bound == None: bound = n
  dif = [6, 4, 2, 4, 2, 4, 6, 2]
  m = 7; i = 1
  while m <= bound and m*m <= n:
    if n%m == 0:
      return m
    m += dif[i%8]
    i += 1
  return n

def factor(n):
  if n in [-1, 0, 1]: return []
  if n < 0: n = -n
  F = []
  while n != 1:
    p = trial_division(n)
    e = 1
    n /= p
    while n%p == 0:
      e += 1; n /= p
    F.append((p,e))
  F.sort()
  return F
 
 
ci = 1
nf = 4		#number of distinct factors
ns = 4		#number of consecutive integers
n = 2*3*5*7	#starting candidate for search
while ci != ns:
  n += 1
  if len(factor(n)) == nf: ci += 1
  else: ci = 0

print "Answer to PE47 = ", n-nf+1