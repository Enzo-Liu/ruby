car = 50
puts "there is #{car} cars"
puts "it's like printf in C/C++,we have %d,%s"%[100,"YEAH!!"]
print car.to_s+'1-0'+" 2-2"
puts 1
puts 2
#as long as we keep the begin & end the same
#we can get this work out
puts <<paragra
sdfsdf
sdfee
dfg sdfwe  dfff c s \n\\r\e水电费、、
fwecdc
paragra

#require 'open-uri'
#open("http://www.baidu.com") do |f|
#  f.each_line {|line| p line}
#  puts f.base_uri
#  puts f.content_type
#  puts f.charset
#  puts f.content_encoding
#  puts f.last_modified
#  puts f.to_s
#end
f,s,t = ARGV
puts "args error" if f.nil? || s.nil? || t.nil?
puts "the name is #{$0},first is #{f},second is #{s} third is #{t}"
