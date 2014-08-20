# -*- coding: utf-8 -*-
require_relative "http.rb"
require 'json'

class Online
  def initialize(cookie)
    @domain ="http://tgplatform.sys.www.dianping.com/"
    @headers = {"cookie"=>"#{cookie}"}
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

online = Online.new("_ga=GA1.2.31529738.1405997284; ticket=AAFSsPYAkNKN6Mb0Q6Li8D8gawrtLLqSxHuVzeS4EIPJ2DqO5LYAE3OO; JSESSIONID=D878A597CE50B26D89BEABD49BE033F1")

#data = File.open('/home/vagrant/host/Desktop/data.txt')
#data.each do |procInstId|
#  procInstId = procInstId.strip!||procInstId
#  data = online.getProcessStatus(procInstId).body.force_encoding("utf-8")
#  puts procInstId if data=~/\"ActivityName":"小编",[^\]]*\"Memo\":\"提交小编制作\"/i && !data.include?("付轶哲")
#end
#data = File.open('/home/vagrant/host/Desktop/handle.txt')
data = [1,11,12,14,15,16,17,18,19,20,21,22,23,24,26,27,28,29,30,32,33,34,35,36,37,57,59,63,64,65,66,68,70,72,73,81,88,89,90,91,92,94,95,96,97,98,99,100,101,102,103,104,109,110,111,112,113,114,115,117,122,123,124,126,127,128,129,133,134,135,136,137,138,139]
data.each do |dealGroupId|
  #dealGroupId = dealGroupId.strip!||dealGroupId
  online.publishTemplate(dealGroupId)
end
