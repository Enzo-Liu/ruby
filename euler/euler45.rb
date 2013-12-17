def isTri(num)
  if((((8*num+1)**0.5-1)/2)%1==0)
    true
  else
    false
  end
end

def isPen(num)
  if((((24*num+1)**0.5+1)/6)%1==0)
    true
  else
    false
  end
end

def isHex(num)
  if((((8*num+1)**0.5+1)/4)%1==0)
    true
  else
    false
  end
end

def hex(num)
  num*(2*num-1)
end

1.upto(100000) {|i|
  a = hex(i)
  if(isPen(a)&&isTri(a))
    puts "the right num is #{a}"
  end
}

