require 'json'
s = File.open("navi").read
h = JSON.parse(s)

def read(h)
  case h
  when Hash
    h.each {|a,b|
      read(b)
      puts b["value"],"Hash" if !b.is_a?Array}
  when Array
    h.each {|b|
      puts b["value"] if !b.is_a?Array
      read(b["children"])
    }
  else
    puts h["value"],h.class if !h.is_a?Array
  end
end

read(h)
