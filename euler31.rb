p = [200,100,50,20,10,5,2,1]

count = 0
length = p.length
left = 200
0.upto(left/200){|i|
  left1 = left-i*200
  0.upto(left1/100){|i|
    left2 = left1-i*100
    0.upto(left2/50){|i|
      left3 = left2 -i*50
      0.upto(left3/20){|i|
        left4 = left3 - i*20
        0.upto(left4/10){|i|
          left5 = left4 - i*10
          0.upto(left5/5){|i|
            left6 = left5- i*5
            0.upto(left6/2){|i|
              left7 = left6 - i*2
              count = count +1
            }
          }
        }
      }
    }
  }
}

#try to use this to learn block/proc
$count=0
def cal(left,a)    
   yield (left) 
   yield (a)
end

cal(20,2) {|b| 0.upto(b){|i| puts i}}


puts count

