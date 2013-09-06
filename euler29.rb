def cal(num)
  r = []
  (2*num).step(num*100,num) {|i|
    r = r + [i]
  }
  return r
end

s = []
2.upto(100) {|i|
  s = s + [i]
}
dps = {}
2.upto(100) { |i|
  case i
  when 2,4,8,16,32,64 ; then  dps[2]= dps[2]==nil ? cal(Math.log(i,2).to_i): dps[2]+cal(Math.log(i,2).to_i)
  when 3,9,27,81 ; then  dps[3]= dps[3]==nil ? cal(Math.log(i,3).to_i) : dps[3]+cal(Math.log(i,3).to_i)
  when 5,25 ; then  dps[5]= dps[5]==nil ? cal(Math.log(i,5).to_i) : dps[5]+cal(Math.log(i,5).to_i)
  when 6,36 ; then  dps[6]= dps[6]==nil ? cal(Math.log(i,6).to_i) : dps[6]+cal(Math.log(i,6).to_i)
  when 7,49 ; then  dps[7]= dps[7]==nil ? cal(Math.log(i,7).to_i) : dps[7]+cal(Math.log(i,7).to_i)
  when 10,100 ; then  dps[10]= dps[10]==nil ? cal(Math.log(i,10).to_i) : dps[10]+cal(Math.log(i,10).to_i)
  else dps[i] = s
  end
}

l = 0
2.upto(100) { |i|
  dps[i] = dps[i].uniq if dps[i] != nil
  l = l + dps[i].length if dps[i] != nil
}
puts l
