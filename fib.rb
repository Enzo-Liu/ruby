require 'benchmark'  
include Benchmark  

def fib_iter(n, a = 1, b = 0)  
  if n == 0 
    a  
  else   
    fib_iter(n - 1, a + b, a)  
  end  
end  

def fib(n)  
  if n == 0
     1  
  elsif n == 1
     1  
  else  
    fib(n-2) + fib(n-1)  
  end  
end  
bmbm(12) do |x|  
  x.report("fib") { 1000.times { fib(30) } }  
  x.report("fib_iter") { 1000.times { fib_iter(30) } }  
end  