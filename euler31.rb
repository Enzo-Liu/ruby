
count = 0
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
puts count
#try to use this to learn block/proc

$p = [200,100,50,20,10,5,2,1]
$length = $p.length
$count = 0
def cal(left,index)
  if(left == 0||index == $length-1)
    $count = $count +1
    return 
  end
    times = left/$p[index]
    0.upto(times) { |i|
      cal(left-i*$p[index],index+1)
    }
end

cal(200,0)
puts $count

