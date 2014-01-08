require "open-uri"  
require "net/https"
require "uri"

module HttpGet
  
  def getFromUri(uri)
    req = Net::HTTP::Get.new(uri,$headers) 
    res = Net::HTTP.start(uri.host) do |http|
        http.request(req)
    end
  end
  
  def postForm(uri,form_data)
    req = Net::HTTP::Post.new(uri,$headers)
    req.set_form_data(form_data) 
    res = Net::HTTP.start(uri.host) do |http|
        http.request(req)
      end
  end
  
  def publish(dealGroupId)
    uri = URI::parse($domain+"publish/fullPublish?dealGroupId=#{dealGroupId}")  
    puts "#{dealGroupId}"+getFromUri(uri,$headers).body
  end

  $method_name = {:changeStatus=>"operation/setStatusId",:changeValid=>"operation/setIsValid",:copySpecial=>"hotel/reCopySpecialReminder"}
  
  $method_name.each do |name,value|
    define_method name.to_s do |dealGroupId,form_data|
      uri = URI::parse($domain+value) 
      puts "#{dealGroupId}"+"--"+name.to_s+"--"+postForm(uri,form_data).body
    end
  end
  
end

class Online
  include HttpGet
  
  $domain ="http://tgplatform.sys.www.dianping.com/"
  #返回的cookie  
  cookie =  'dpadmin=e46ad4c1db08c6250e972340248ca9bf6b39779a97f73c07c6329eb301c044030a6717083c80a0f65442e3497db84b2b551a46e1edf775466e2b63ac7e01d95b;'  
  $headers = {"cookie"=>cookie}
  
end
  
class Beta
  $domain ="http://tgplatform.a.51ping.com/"
  #返回的cookie  
  cookie =  'dpadmin=093d7cddf6723882e44286d02a5624d9a1a35f694155078348ac6469ca7aa9e8dcd0c59958d1956fed0d39a09a49066fa5550ea0cea7c3efe018eab076421c4d;'  
  $headers = {"cookie"=>cookie}
  
  include HttpGet
end

# online = Online.new
# [2079479].each do |dealGroupId|
#   form_data = {:statusId=>0,:isValid=>false,:dealGroupId=>dealGroupId}
#   online.changeStatus(dealGroupId,form_data)
#   online.changeValid(dealGroupId,form_data)
# end

beta = Beta.new
form_data = {:sampleDealGroupId=>2100013,:targetDealGroupId=>2100026}
beta.copySpecial(2100026,form_data)

