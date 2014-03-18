require "open-uri"  
require "net/https"
require "uri"

module HttpGet
  attr_reader :headers,:domain
  def getFromUri(uri)
    req = Net::HTTP::Get.new(uri,@headers) 
    res = Net::HTTP.start(uri.host) do |http|
        http.request(req)
    end
  end

  def postForm(uri,form_data)
    req = Net::HTTP::Post.new(uri,@headers)
    req.set_form_data(form_data) 
    res = Net::HTTP.start(uri.host) do |http|
        http.request(req)
      end
  end

  adminMethodName={:publish=>"publish/fullPublish",:offline=>"admin/offline",:hide=>"admin/changeHideStatus"}

  adminMethodName.each do |name,value|
    define_method name.to_s do |dealGroupId|
      uri = URI::parse(@domain+"#{value}?dealGroupId=#{dealGroupId}")  
      puts "#{dealGroupId}"+"--"+name.to_s+"--"+getFromUri(uri).body
    end
  end

  method_name = {:changeStatus=>"operation/setStatusId",:changeValid=>"operation/setIsValid",:copySpecial=>"hotel/reCopySpecialReminder"}

  method_name.each do |name,value|
    define_method name.to_s do |dealGroupId,form_data|
      uri = URI::parse(@domain+value) 
      puts "#{dealGroupId}"+"--"+name.to_s+"--"+postForm(uri,form_data).body
    end
  end


  def extend(dealGroupId,toDate)
    uri = URI::parse(URI.encode(@domain+"action/test/modifyEndDate"))
    form_data={"json"=>"{\"DealGroupID\":#{dealGroupId},\"ReceiptEndDate\":\"#{toDate}\",\"BlackDates\":[]}"}
    puts uri.to_s
    postForm(uri,form_data)
  end
end


