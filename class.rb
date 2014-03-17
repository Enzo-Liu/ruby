class Test
end

test = Test.new
def test.speak
  "sdf"
end
metaclass = class << test;self;end
puts metaclass.instance_methods.grep(/speak/)
puts Test.name
Test.instance_eval do
  def namde
    "sdfsdfsdf"
  end
  def self.namee
    "nameee"
  end
end
Test.class_eval do
  def namde
    "class"
  end
  puts "sdf"+self.name
end
puts Test.namde
puts Test.namee
puts test.namde
test.class_eval do
  def test
    puts "test"
  end
  puts self
end
test.test
a = Test.new
a.test
