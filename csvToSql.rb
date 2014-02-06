#encoding=UTF-8
arg=ARGV[0]
text = File.open("#{arg}").read 
text.gsub!(/\r\n?/,"\n")
text.each_line do |line|
    s = line.to_s
    ss = s.split(",")
    #puts "insert into Temp_K2_Comment1 (ProcInstID,Action,LoginID,RealName,ActivityName,AddDate,ProcessCode) values (\"#{ss[0].chomp()}\",\"#{ss[1]}\",\"#{ss[2]}\",\"#{ss[3]}\",\"#{ss[4]}\",\"#{ss[5]}\",\"#{ss[6].chomp()}\"\n);"
    #puts "update `TGP_DEAL_GROUP` set `SUBMIT_FOR_MERCHANT_CONFIRM_DATE`='#{ss[2].chomp}' where `DEAL_GROUP_ID`=#{ss[0]};"
    sdate = ss[5].split(".")
    date = Time.mktime(sdate[0],sdate[1],sdate[2])
    puts s if  date.wday ==0|| date.wday ==6
end
