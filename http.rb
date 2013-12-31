require "open-uri"  
require "net/https"
require "uri"

#返回的cookie  
cookie =  'dpadmin=360cc4800098092534fa9aedb4a78bf0b33f67e84c35660076ba6c9eab84847e0d3614348edfa4d4a8bf630529b40a28322230194c2ac52ef51c2ba4f310b9b1; Domain=dper.com; Expires=Mon, 30-Dec-2013 22:38:45 GMT; JSESSIONID=EA9BE36A86DCE564D7ED47571E79D82C; '  
$headers = {"cookie"=>cookie}

def getFromUri(dealGroupId,uri,headers)
  req = Net::HTTP::Get.new(uri,headers) 
  res = Net::HTTP.start(uri.host) do |http|
      http.request(req)
  end
  return res
end
  
def postForm(dealGroupId,uri,headers)
  req = Net::HTTP::Post.new(uri,$headers)
  req.set_form_data(:statusId=>0,:isValid=>false,:dealGroupId=>dealGroupId) 
  res = Net::HTTP.start(uri.host) do |http|
      http.request(req)
    end
  return res;
end

def publish(dealGroupId)
  uri = URI::parse("http://tgplatform.sys.www.dianping.com/publish/fullPublish?dealGroupId=#{dealGroupId}")  
  res = getFromUri(dealGroupId,uri,$headers)
  puts "#{dealGroupId}"+res.body
end

# def changeStatus(dealGroupId)
#   uri = URI::parse("http://tgplatform.sys.www.dianping.com/operation/setStatusId")  
#   res = postForm(dealGroupId,uri,$headers)
#   puts "#{dealGroupId}"+"--status--"+res.body
# end
# 
# def changeIsValid(dealGroupId)
#   uri = URI::parse("http://tgplatform.sys.www.dianping.com/operation/setIsValid") 
#   res = postForm(dealGroupId,uri,$headers)
#   puts "#{dealGroupId}"+"--valid--"+res.body
# end

$method_name = {:Status=>"operation/setStatusId",:Valid=>"operation/setIsValid"}
class <<self
  $method_name.each do |name,value|
    define_method "change"+name.to_s do |dealGroupId|
      uri = URI::parse("http://tgplatform.sys.www.dianping.com/"+value) 
      res = postForm(dealGroupId,uri,$headers)
      puts "#{dealGroupId}"+"--"+name.to_s+"--"+res.body
    end
  end
end
  
[2079479].each do |dealGroupId|
  changeStatus(dealGroupId)
end
# [0].each do |dealGroupId|
#   publish(dealGroupId)
# end
# [].each do |dealGroupId|
#   changeStatus(dealGroupId)
#   changeIsValid(dealGroupId)
# end

