#!/usr/bin/python
# -*- coding: utf-8 -*-
 
def isCuriousFraction(numerator, denomiator):
    for digit in str(numerator):
        if digit in str(denomiator):
            for i, j in [(i,j) for i in range(0,2) for j in range(0,2)]:
                if str(numerator)[i] == digit == str(denomiator)[j]:
                    if int(str(denomiator)[(j+1)%2]) == 0:
                        continue # devision through 0 is bad
                    canceled = float(str(numerator)[(i+1)%2]) / \
                                        int(str(denomiator)[(j+1)%2])
                    divided = float(numerator) / denomiator
                    if abs(canceled-divided) < 0.0001:
                            print("%i/%i = %s/%s" % (numerator, \
                                denomiator, str(numerator)[(i+1)%2],\
                                str(denomiator)[(j+1)%2]))
                            return True
 
if __name__ == "__main__":
    for i in xrange(10, 100):
        if i % 10 == 0: # those are not interesting
            continue
        for j in xrange(i+1, 100):
            isCuriousFraction(i, j)