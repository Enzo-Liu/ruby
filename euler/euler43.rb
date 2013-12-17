load "euler41.rb"

def isSubStrDiv(num)
  i = 1
  p = [2,3,5,7,11,13,17]
  s = num.to_s
  if s.length<10||num%2==0
    return 0
  end
  while(i+2<10) do
  subNum = s[i..i+2].to_i
  if(subNum%p[i-1]!=0)
    return 0
  end
  i = i+1
  end
  return 1
end

array = genFromArray([0,1,2,3,4,5,6,7,8,9])
sum = 0
len = array.length
i = 0
while i<len do
  if(isSubStrDiv(array[i])==1)
	sum = sum + array[i]
  end
  i=i+1
end
puts sum

