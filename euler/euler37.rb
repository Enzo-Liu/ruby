load "~/Work/ruby/prime.rb"

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

ps = Prime.new(1000000)
parray = ps.getPrimes()
l = parray.length
count = 0
index = 0
sum = 0
while count<11
  p = parray[index]
  index = index +1
  next if p<=10
  s = p.to_s
  ll = s.length
  t = ll
  while(t>0) 
    t1 = s[0..t-1].to_i
    t2 = s[t-1..ll-1].to_i
    break if !ps.containP(t1) || !ps.containP(t2)
    t = t-1
  end
  count = count +1 if t==0
  sum = sum +p if t==0
  puts p if t==0
end
puts sum
    
