require "open-uri"  
require "net/https"
require "uri"

#返回的cookie  
cookie =  'dpadmin=360cc4800098092534fa9aedb4a78bf0b33f67e84c35660076ba6c9eab84847e0d3614348edfa4d4a8bf630529b40a28322230194c2ac52ef51c2ba4f310b9b1; Domain=dper.com; Expires=Mon, 30-Dec-2013 22:38:45 GMT; JSESSIONID=EA9BE36A86DCE564D7ED47571E79D82C; '  
$headers = {"cookie"=>cookie}

def getFromUri(dealGroupId,uri)
  req = Net::HTTP::Get.new(uri,$headers) 
  res = Net::HTTP.start(uri.host) do |http|
      http.request(req)
  end
end

def publish(dealGroupId)
  uri = URI::parse("http://tgplatform.sys.www.dianping.com/publish/fullPublish?dealGroupId=#{dealGroupId}")  
  puts "#{dealGroupId}"+getFromUri(dealGroupId,uri,$headers).body
end

def postForm(uri,form_data)
  req = Net::HTTP::Post.new(uri,$headers)
  req.set_form_data(form_data) 
  res = Net::HTTP.start(uri.host) do |http|
      http.request(req)
    end
end

$method_name = {:Status=>"operation/setStatusId",:Valid=>"operation/setIsValid"}
class <<self
  $method_name.each do |name,value|
    define_method "change"+name.to_s do |dealGroupId,form_data|
      uri = URI::parse("http://tgplatform.sys.www.dianping.com/"+value) 
      puts "#{dealGroupId}"+"--"+name.to_s+"--"+postForm(uri,form_data).body
    end
  end
end
  
[2079479].each do |dealGroupId|
  form_data = {:statusId=>0,:isValid=>false,:dealGroupId=>dealGroupId}
  changeStatus(dealGroupId,form_data)
  changeValid(dealGroupId,form_data)
end

