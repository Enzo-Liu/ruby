File.open("1") do |file|  
  file.each_line{|line| 
    begin 
      puts line.encode!("ISO-8859-1").force_encoding("UTF-8")  
    rescue
      puts line
    end
  }  
file.close();  
end
