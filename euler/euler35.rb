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

def getCir (num)
  s = num.to_s
  a = s.split(//)
  l = a.length
  r = []
  1.upto(l) {
    r = r+ [a.rotate!.join("").to_i]
  }
  return r
end

ps = Prime.new(1000000)
parray = ps.getPrimes()
l = parray.length
count = 0
0.upto(l-1) { |i|
  p = parray[i]
  temp = getCir(p)
  ll = temp.length
  j = 0
  while(j<ll)
    break if !ps.containP(temp[j])
    j = j+1
  end
  count = count +1 if j==ll
  puts p if j==ll
}
puts count

