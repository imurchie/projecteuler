def solve():
    biglhs = 9182
    digits = map(str, xrange(1,10))
    for lhs in xrange(9183,10000):
        need = digits[:] # make a copy
        # get rid of digits in the lhs
        for d in str(lhs):
            if need.count(d): need.remove(d)
            else: break # quit early, MASSIVE speed improvement
        # if lhs is unique digits, and rhs is the remaining digits
        if len(need) == 5 and need == sorted(map(str, str(2*lhs))):
            biglhs = lhs
    biggest = "%s%s"%(biglhs,2*biglhs)
    return biggest
    
print solve()