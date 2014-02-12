#!/usr/bin/env ruby
#DEAL_GROUP_PRODUCE_VERSION_ID,DEAL_GROUP_ID,CREATOR_ID,LAST_UPDATOR_ID,"CREATE_TIME","LAST_UPDATE_TIME","DESC_INFO","IP_ADDRESS"


def handle(map,dealGroupId,creatorId,createTime,descInfo)
  info={
    :creatorId=>creatorId,
    :createTime=>createTime,
    :descInfo=>descInfo
  }
  return if dealGroupId.eql? "0"
  infoList = map[dealGroupId]
  if infoList==nil
    infoList=[]
    map[dealGroupId]=infoList 
  end
  infoList<<info  
end

def analyse(map)
  map.each{|dealGroupId,infoList|
    oper={}
    infoList.each{|info|
      operPerPerson = oper[info[:creatorId]]
      if operPerPerson==nil
        operPerPerson=[]
        oper[info[:creatorId]]=operPerPerson
      end
      operPerPerson<<"#{info[:descInfo]}|#{info[:createTime]};"
    }
    timeMap={}
    oper.each{|creatorId,strList|
      timeMap[creatorId]=[]
      timePair=[]
      strList.each{|key|
      desc = key.split("|")[0]
      time = key.split("|")[1]
      if desc=~/\"load-page(2|3)\"/
        timePair=[]
        timePair<<time
      elsif desc=~/\"save-page(2|3)\"/
        timePair<<time
        timeMap[creatorId] << timePair
      end
      }
    }
    puts dealGroupId+","+infoList.length.to_s+","+oper.inspect if conflict?(timeMap)
    #puts dealGroupId+","+infoList.length.to_s+","+oper.inspect 
  }
end
$time=0
def conflict?(timeMap)
  array=[]
  timeMap.each_value{|timeList|
    array+=timeList
  }
  array.sort!{|a,b| a[0]<=>b[0]}
  array.each_with_index{|timePair,index|
    if index>0 && (timePair[0]<=>array[index-1][1])==-1
     # $time+=1
      return true
    end
  }
  return false
end

text = File.open("/Users/liuenze/Desktop/TGP_DEAL_GROUP_PRODUCE_VERSION.csv").read
#text = File.open("test").read
text.gsub!(/\r\n?/,"\n")
map={}
text.each_line do |line|
  data = line.split(",") 
  dealGroupId,creatorId,createTime,descInfo = data[1],data[2],data[4],data[6]
  handle(map,dealGroupId,creatorId,createTime,descInfo)
end

analyse(map)
puts $time
