#initialize the number index
# to distinguish from 1-9,10-99,100-999 etc
$num1 = 9
$num2 = 90*2+$num1
$num3 = 900*3+$num2
$num4 = 9000*4+$num3
$num5 = 90000*5+$num4
$num6 = 900000*6+$num5
def getNum(start,last,len)
	(10**(len-1)+(last-start)/len).to_s[(last-start)%len].to_i
end
def getIndex(num)
	case num
	when 1..$num1
	return getNum(1,num,1) 
	when $num1+1..$num2
	return getNum($num1+1,num,2) 
	when $num2+1..$num3
	return getNum($num2+1,num,3)
	when $num3+1..$num4
	return getNum($num3+1,num,4)
	when $num4+1..$num5
	return getNum($num4+1,num,5)
	when $num5+1..$num6
	return getNum($num5+1,num,6)
	else puts 'over my thinking'
	end
end
puts getNum(10,15,2)
puts getIndex(11)
p = 1
for i in 0..6 do
n = 10**i
index = getIndex(n)
p = p*index
puts 'index is '+ index.to_s 
puts ' and num is '+ n.to_s
end
puts 'the product is ' + p.to_s
