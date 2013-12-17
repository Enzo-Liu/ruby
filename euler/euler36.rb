def isPalindromic(num)
  return false if num%10==0||num%2==0
  s = num.to_s
  s2 = num.to_s(2)
  return s == s.reverse && s2 == s2.reverse
end

sum = 0
0.upto(1000000) {|i|
  sum = sum +i if isPalindromic(i)
}
puts sum
