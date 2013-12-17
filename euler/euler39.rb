puts 'Hello World'
puts 'eeee'
puts 'eeeeedddd'
input = 1
max = 0
maxNum = 0
while (input<=1000) do
	num = 0
	c = input/2
	minC = input/3
	loop do
	maxA = (input-c)/2
	a = 1
	while (a<maxA) do
		b = input-c-a
		if (a**2+b**2==c**2) 
			num+=1
		end
		a+=1
	end
	if(num>max) 
		max = num
		maxNum = input
	end
	c-=1
	break if c<=minC
	end
	input +=1
end
puts "max num is "+maxNum.to_s

