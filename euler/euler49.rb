load "~/Work/ruby/prime.rb"

class Prime
  def initialize(max)
    @primes = [2]
    @length = 1
    t = 3
    while @primes[@length-1]<max do
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

def genSeq(num)
  s = num.to_s
  l = s.length
  r = []
  0.upto(l-1) {|i|
    r = r+[s[i].to_i]
  }
  r = r.permutation.to_a
  r.map! {|item|
    item = item.join.to_i
  }
  r.delete_if {|item|
    item.to_s.length<l
  }
  r.uniq
end


ps = Prime.new(9999)
parray = ps.getPrimes()
l = parray.length
pr = []
0.upto(l-1) { |i|
  p = parray[i]
  if(p>=1000)
    s = genSeq(p)
    r = [] 
    for t in s do
      r = r+[t] if ps.containP(t)
    end
      if r.length>=3
      pr = pr + r.combination(3).to_a 
      end
  end
}
pr.uniq!
r = []
for p in pr do  
  p = p.sort
  r = r+[p] if p[0]+p[2] == 2*p[1] && !r.include?(p)
end
puts r.to_s

