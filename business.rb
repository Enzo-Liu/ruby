require_relative "http.rb"
require 'json'

class Online
  def initialize(cookie)
    @domain ="http://tgplatform.sys.www.dianping.com/"
    @headers = {"cookie"=>"dpadmin=#{cookie};"}
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

online = Online.new("3ee2e005d678560bacb8402b479e4aef073f6fbe5a5d266ea8434a7c29a7d6c1a690d0695fa1caa480344216d9fa1bef787b24a09a5b9ecec230f9bd1dba991f")

#data = File.open('/home/vagrant/host/Desktop/full_proctId.txt')
#data.each do |procInstId|
#  procInstId = procInstId.strip!||procInstId
#  data = online.getProcessStatus(procInstId).body.force_encoding("utf-8")
#  puts procInstId if data.include?("\"LoginID\":100,\"Memo\":\"提交小编制作\"") && !data.include?("付轶哲")
#end
data = File.open('/home/vagrant/host/Desktop/full_handle.txt')
data.each do |dealGroupId|
  dealGroupId = dealGroupId.strip!||dealGroupId
  online.submitProduce(dealGroupId)
end


