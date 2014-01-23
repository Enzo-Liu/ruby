load "~/Work/git/ruby/euler/prime.rb"

class Prime
  def initialize(max)
    @primes = [2]
    @length = 1
    t = 3
    while t<max do
      if(isPrime(t))
        @primes[@length]=t
        @length = @length+1
      end
      t = t+2
    end
  end
  
  def getPrimes
    return @primes
  end
end
r = {}
ps = Prime.new(1000000)
parray = ps.getPrimes()
max = 0
l = parray.length
0.upto(l-1) { |i|
  count = 0
  sum = 0
  j = i 
  while(j<l)
    p = parray[j]
    sum = sum +p
    puts "sum is #{sum},count is #{j-i+1}"  if j-i+1>max && sum<=1000000 && ps.containP(sum)&&max = j-i+1
    break if sum>=1000000
    j = j +1
  end 
}

