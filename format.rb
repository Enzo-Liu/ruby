target = File.open("/Users/liuenze/Desktop/data.csv").read.split("\r")
File.open("/Users/liuenze/Desktop/source.csv") do |file|  
  text = file.read.split("\r").keep_if{ |line|
    target.include?(line.split(",")[2])
  }
  text.each{ |line|
    puts line
  }
end
