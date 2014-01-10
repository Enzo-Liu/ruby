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
  
  def publish(dealGroupId)
    uri = URI::parse(@domain+"publish/fullPublish?dealGroupId=#{dealGroupId}")  
    puts "#{dealGroupId}"+getFromUri(uri).body
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
    @headers = {"cookie"=>'dpadmin=6c814ec417cf94cb840ed833761423d248ed8a453764e3b4082eaa1457798bc230878ba894bcb9a0ae7a84886257c450c886d65b9e8ab46767d33deb71eb8654;'}
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
#form_data = {:sampleDealGroupId=>0,:targetDealGroupId=>0}
[0].each do |dealGroupId|
  beta.publish(dealGroupId)
end

