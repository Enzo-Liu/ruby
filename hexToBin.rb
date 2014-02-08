filename = ARGV[0]
$bytes = []
File.open(filename, "r") do |file|
    file.each_line {|str|
      $bytes+=str.split.map{|byte|
        byte.hex
      }
        
    }
end
puts $bytes.count
newfilename = filename + ".bin"
File.open(newfilename, "wb") do |file|
    file.write $bytes.pack("C*")
end
