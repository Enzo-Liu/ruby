load '~/Work/ruby/prime.rb'

ps = Prime.new(1000)
i = 3
loop do
  if !ps.containP(i)&&!ps.isCon?(i)
    puts "min num is #{i}"
    break
  end
  i = i+2
end

    
