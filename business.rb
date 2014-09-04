# -*- coding: utf-8 -*-
require_relative "http.rb"
require 'json'

class Online
  def initialize(cookie)
    @domain ="http://tgplatform.sys.www.dianping.com/"
    @headers = {"Cookie"=>"#{cookie}","User-Agent"=>"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.36"}
  end
  include HttpGet
end

class NOnline
  def initialize(cookie)
    @domain ="https://a.dper.com/dt/"
    @headers = {"User-Agent"=> "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.94 Safari/537.36","Content-Type"=>"text/plain; charset=utf-8","Accept"=>"*/*","Accept-Encoding"=>"gzip,deflate","Accept-Language"=>"en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,zh-TW;q=0.2","Cookie"=>"#{cookie}"}
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

online = NOnline.new("BIGipServertp-deal-admin-web=3496542474.20480.0000; __utma=126175325.31529738.1405997284.1409016443.1409039709.3; __utmc=126175325; __utmz=126175325.1408818111.1.1.utmcsr=(direct)|utmccn=(direct)|utmcmd=(none); _ga=GA1.2.31529738.1405997284; ticket=AAFSsPYAkNKN6Mb0Q6Li8D8gawrtLHw2Z6TM1MkwuUNJGZ1KAKpuDvAJ; JSESSIONID=C9955B9C142ABEED2BFCDEDF128818F5")

#data = File.open('/home/vagrant/host/Desktop/data.txt')
#data.each do |procInstId|
#  procInstId = procInstId.strip!||procInstId
#  data = online.getProcessStatus(procInstId).body.force_encoding("utf-8")
#  puts procInstId if data=~/\"ActivityName":"小编",[^\]]*\"Memo\":\"提交小编制作\"/i && !data.include?("付轶哲")
#end
#data = File.open('/home/vagrant/host/Desktop/handle.txt')
data = [6396559,6405096,6407437,6411960,6417708,6420902,6426112,6428508,6428698,6429822,6435602,6438642,6439235,6439312,6439954,6441781,6442377,6446533,6446982,6451605,6452755,6459282,6460946,6463765,6472484,6477491,6480381,6481025,6483091,6483631,6483763,6484486,6491340,6491489,6492507,6457645]
data.each do |dealGroupId|
  #dealGroupId = dealGroupId.strip!||dealGroupId
  online.display_new(dealGroupId,"")
end
