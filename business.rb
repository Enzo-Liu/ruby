require "./http.rb"
require 'json'

class Online
  def initialize
    @domain ="http://tgplatform.sys.www.dianping.com/"
    @headers = {"cookie"=>'dpadmin=46cae279621d9ebd3c9b4a1882cf5730308bc6483e560672b7267455ae89041bb01c1f2d779ba419938f94d581af43afd3f4a93048ad430616ffc0d96dcd7503;'}
  end
  include HttpGet 
end
class Dev
  def initialize
    @domain ="http://t.sys.local.dp:8080/"
    @headers = {"cookie"=>'p_sys_www=e3iof3455neq1p3512mtxu55; __utma=160316152.117814055.1386928687.1393305730.1393313141.68; __utmc=160316152; __utmz=160316152.1386928687.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); JSESSIONID=FA25413FA84C9E5854178CC4743D3D62; dpadmin=6be5a3cda843f8b75ad52a1de1a03b7fea86964ac9e404f7e7cb1dafeb7a6e8d0e10edb8a4945be74dc63ebffc4f28a6e2b15b7928bab40371473c8fe5520bac; ab=""',"host"=>'t.sys.local.dp:8080'}
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

text = File.open("/Users/liuenze/Desktop/data.csv").read
 online = Online.new()
 num = 0
text.split(',')
.each do |dealGroupId|
  if (num>=9516)
    online.extend(dealGroupId,"2014-03-31 00:00:00")
  end
  num+=1
  puts num
end
