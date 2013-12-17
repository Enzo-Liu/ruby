base = [9,8,7,6,5,4,3,2,1]
array = base.permutation.to_a

def canGen?(num)
  s = num.to_s
  #can divide into 2
  return true if s[0..3].to_i*2==s[4..8].to_i
  return true if s[0..2].to_i*2==s[3..5].to_i && s[0..2].to_i*3==s[6..8].to_i
  return false
end


l = array.length
i = 0
while i<l 
  break if canGen?(array[i].join("").to_i)
  i = i +1
end
puts array[i].join("")
