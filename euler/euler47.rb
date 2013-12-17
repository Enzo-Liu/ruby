load '~/Work/ruby/prime.rb'

ps = Prime.new(13000)
i = 1 
loop do
  if(4 == ps.genPrimeFactors(i).size)
    s = 1
    1.upto(3) { |a|
      if(4==ps.genPrimeFactors(i+a).size)
        s= s+1
      end
    }
    if(s==4)
      puts "the first number is #{i}"
      break
    end
  end
  i = i+1
end

