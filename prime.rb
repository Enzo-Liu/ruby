class Prime
  def initialize(num)
    @primes = [2]
    @length = 1
    t = 3
    while @length<=num do
      if(isPrime(t))
        @primes[@length]=t
        @length = @length+1
      end
      t = t+2
    end
  end

  def containP(num)
    false if(num!=2&&num%2==0)
    high = @length-1
    low = 0
    mid = (high-low)/2+low
    while(high-low!=1) do
      if(@primes[mid]==num)
        return true
      elsif (@primes[mid]>num)
        high = mid
        mid = (high-low)/2+low
      else
        low = mid
        mid = (high-low)/2+low
      end
    end
    if(@primes[low]==num||@primes[high]==num)
      return true
    end
    return false
  end

  def genPrimeFactors(num)
    i=0
    result = []
    t=num
    max = (t**0.5).to_i
    while @primes[i]<=max do
      if(t % @primes[i]==0)
        t = t/@primes[i]
        if(result[-1]!=@primes[i])
          result = result + [@primes[i]]
        end
      else
        i = i+1
      end
    end
    if(containP(t))
      result = result + [t]
    elsif(t!=1)
      puts "error,num is #{num}"
      puts result
    end
    return result
  end

  def isCon?(num)
    i = 0
    while @primes[i]<num do
     return true if ((num-@primes[i])/2)**0.5%1==0
     i = i+1
    end
    return false
  end

  private
  def isPrime(t)
    max = (t**0.5).to_i
    0.upto(@length-1){|i|
      if(t % @primes[i] == 0)
        return false
      end
      if(max<@primes[i])
        return true
      end
    }
    true
  end
end

