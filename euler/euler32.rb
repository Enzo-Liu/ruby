#in pre thinking,only 2*3=4 &1*4=4 is possible
a = [1,2,3,4,5,6,7,8,9]
sum = 0
  c = a.permutation(4).to_a
  l =  c.length
  0.upto(l-1) { |i| 
    n = c[i].join("").to_i
    left = a - c[i]
    1.upto(2) { |b2|
      c2 = left.permutation(b2).to_a
      ll = c2.length
      0.upto(ll-1) { |j|
        n2 = c2[j].join("").to_i
        puts "n=#{n},n2=#{n2},n3=#{n/n2},sum=#{sum=sum+n}" if n%n2==0 && !(n/n2).to_s.split(//).include?("0")  && (left-c2[j]).sort.join("").to_i == (n/n2).to_s.split(//).sort.join("").to_i
      }
    }
}

#2*3 &&1*4
#n4=4396,n2=28,n3=157,sum=4396
#n4=5346,n2=18,n3=297,sum=9742
#n4=5346,n2=27,n3=198,sum=15088
#n4=5796,n2=12,n3=483,sum=20884
#n4=5796,n2=42,n3=138,sum=26680
#n4=6952,n1=4,n4=1738,sum=33632
#n4=7254,n2=39,n3=186,sum=40886
#n4=7632,n2=48,n3=159,sum=48518
#n4=7852,n1=4,n4=1963,sum=56370
puts 56370-5796-5346
