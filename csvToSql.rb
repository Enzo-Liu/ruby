#encoding=UTF-8
arg=ARGV[0]
open("#{arg}") do |file|  
  file.each{|line| 
    s = line.to_s
    ss = s.split(",")
    puts "insert into Temp_K2_Comment1 (ProcInstID,Action,LoginID,RealName,ActivityName,AddDate,ProcessCode) values (\"#{ss[0].chomp()}\",\"#{ss[1]}\",\"#{ss[2]}\",\"#{ss[3]}\",\"#{ss[4]}\",\"#{ss[5]}\",\"#{ss[6].chomp()}\"\n);"
  }

  file.close();  
end  
