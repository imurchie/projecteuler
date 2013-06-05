

# convergence of e

# √2  = 1 + 1/2
#     = 1 + 1 / (2 + 1/2)




def evaluate(function)
  a = "2.0"
  
  ff = function.sub(/a/, a)
  puts ff
  puts eval(ff)
end



# f = "1 + 1/(a)"
f = "(a)"

0.upto(10) do |i|
  #evaluate(f)
  
  f.sub!(/a/, "2.0 + 1.0/(a)")
  
  
end