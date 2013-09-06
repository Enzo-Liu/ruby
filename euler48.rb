def getLast(num,size=10)
  s = num.to_s
  l = s.length
  s = s[(l<size ? 0 : (l-size) ) .. l-1]
  s.to_i
end



def selfPowers_10(num)
  t = 1
  1.upto(num){ |i|
    t = t*num
    t = getLast(t)
  }
  t
end

s = 0
1.upto(1000) {|i|
  s = s + selfPowers_10(i)
  s = getLast(s) if s>100000000000
  puts "s is #{s}"+" i is #{i} powers is #{selfPowers_10(i)}"
 }

puts getLast(s)
