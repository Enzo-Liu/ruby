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
  
end

class Online
  def initialize
    @domain ="http://tgplatform.sys.www.dianping.com/"
    @headers = {"cookie"=>'dpadmin=c9a9554bfe07515ae6608ce6a27eb41852a2ce15128de60fb260cb92ecb7596c28d6a28110e5bf197a3ae8a30f9b563b263b0eeeafb7b19321a18953b77983c5;'}
  end
  include HttpGet 
end
  
class Beta
  def initialize
    @domain ="http://tgplatform.a.51ping.com/"
    @headers = {"cookie"=>'dpadmin=d2a9dbebb0a821ec858f2fc28dac5789d493a6846cf0f5866363b50885bc1ec0d3bcb49ce919a74c7a3e872b1ce9525a1e48eb2e5dafb50490d6a71430b004f4;'}
  end
  include HttpGet
end

# online = Online.new
# [2079479].each do |dealGroupId|
#   form_data = {:statusId=>0,:isValid=>false,:dealGroupId=>dealGroupId}
#   online.changeStatus(dealGroupId,form_data)
#   online.changeValid(dealGroupId,form_data)
# end

beta = Online.new
[2044629,2051841,2039050,2039166,2039179,2039190,2039208,2047335,2047315,2046976,2121117,2121080,2126596,2130833,2130964,2130946,2128727,2132170,2130032].each do |dealGroupId|
  form_data = {:sampleDealGroupId=>2096544,:targetDealGroupId=>dealGroupId}
  #beta.copySpecial(dealGroupId,form_data)
  beta.publish(dealGroupId)
end

