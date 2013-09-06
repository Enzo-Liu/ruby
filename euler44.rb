#input 'ruby test.rb 1.txt'
#in the command line
#can see the result if there is a 1.txt in folder
s = gets
puts s
txt = File.open("1.txt")
puts txt.read()
puts 'business application'

def pentagonal(num)
  num*(3*num-1)/2
end

def isPen(num)
  if(num==0)
    return 0
  end
  n = ((1+Math.sqrt(24*num+1))/6).to_i
  if(3*n*n-n == 2*num)
    return 1
  else
    return 0
  end
end
now = Time.new;
$p = []
for i in 0..10000000 do
  $p[i] = pentagonal(i+1)
end

i = 1 
j = 0

puts "当前日期：" + now.strftime("%Y-%m-%d %H:%M:%S");
loop do
  n = $p[i]-$p[j]
  if(isPen(n)==1&& isPen((n-$p[j]).abs)==1)
    puts "answer is:\ndiff is #{(n-$p[j]).abs} sum is #{$p[i]} num:#{n},#{$p[j]}"
    puts "i:#{i},j:#{j}"
    break
  else
    if(j+1==i)
      i=i+1
      j=0
    else
      j=j+1
    end
  end
end
cost = Time.new - now
puts "cost time is #{cost}"
