include Math
size = 7

def fact(n)   
  if n == 0   
	1   
  else  
	n * fact(n-1)   
  end  
end

def isPrime (input)
	root = sqrt(input)
	return 1 if input == 2
	return 0 if input%2==0
	i = 3
	while i<root do
	  return 0 if input%i==0
	  i = i+2
	end
	return 1
end


def makeNum (nums)
  stack = [nums]
  list = []
  while !stack.empty? do
     curr = stack.pop();
    if curr[1].length == 1
      list = list +[curr[0]*10+curr[1][0]] 
    else
	  head = curr[0]
      if head == 0  
	    array = curr[1]
		len = array.length
	    i = 0
	    while (i<len) do
	      t = array[i]
	      tArray = (array-[t])
	      i = i+1
		  stack.push([t,tArray])
        end
	  else
		len = curr.length
		while 1<len do
		  if(curr[1].length != 1)
            array = curr.delete_at(1)
	        len = len-1
			ai = 0
			alen = array.length
			while ai<alen do
			  at = array[ai]
			  atArray = array -[at]
			  ai = ai+1
			  curr.push([at,atArray])
	       end
	      else
            break
	      end
		  stack.push(curr)
        end

	  end
	  puts 'stack is '+stack.to_s
	  puts 'list is '+ list.to_s
    end
  end	
  return list
end

def genFromArray(array)
	len = array.length
	if len <=1
	  return array
	end
	i=0
	fArray = []
	while i<len do
	   tArray = genFromArray(array-[array[i]])
	   t=0
	   tLen = tArray.length
	   while t<tLen do
	      tArray[t] = tArray[t]*10+array[i]
		  t=t+1
	   end
	   i=i+1
	   fArray = fArray+tArray
	end
	return fArray
end
nums =  genFromArray([1,2,3,4,5,6,7])
numLen = nums.length
max = 0
i=0
while i<numLen do
  if(isPrime(nums[i])==1)
	max = nums[i] if nums[i]>max
  end
  i=i+1
end
puts max
puts nums
