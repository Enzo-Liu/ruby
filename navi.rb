require 'json'
s = File.open("navi").read
h = JSON.parse(s)

def read(h)
  case h
  when Hash
    h.each {|a,b|
      puts b if a=="value"
      read(b)}
  when Array
    h.each {|b| read(b) }
  end
end

read(h)
