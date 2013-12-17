1.upto(9) { |i|
  10.upto(99) { |j|
    a = j.to_s[0].to_i
    b = j.to_s[1].to_i
    puts "i is #{i},j is #{j}" if a!=b && (a*10.0+i)/(i*10.0+b) == a*1.0/b
  }
}

