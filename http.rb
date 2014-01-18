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
    @headers = {"cookie"=>'dpadmin=c37085b4191261bfb3356f0905a2106770d4b70225af75cd04337c52e3f3fe4a46a36bcb780c6d67b5056d98e74776a1549868b50a2d43fe3234686b05955c10;'}
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
[2006578,2007834,2034773,2050028,2067233,2067253,2067282,2072485,2075528,2076792,2076794,2077650,2080009,2081173,2081268,2081903,2082949,2083212,2084906,2085156,2087321,2087442,2087514,2087524,2087675,2087866,2087911,2087918,2089428,2089441,2090071,2090199,2090646,2091625,2091932,2091966,2091971,2091979,2092017,2092392,2092494,2092802,2092908,2093530,2093560,2093569,2093575,2093610,2093704,2093736,2093978,2094134,2094148,2094157,2094580,2094592,2094624,2094745,2094771,2094783,2095249,2096083,2096252,2096272,2096413,2096427,2096439,2096492,2096501,2096550,2096654,2096658,2096660,2096664,2096668,2096802,2096952,2096959,2096997,2097003,2097005,2097259,2097485,2097517,2097559,2097562,2097583,2097585,2097587,2097598,2097610,2097626,2097649,2097651,2097675,2097696,2097707,2097730,2097732,2097744,2097765,2097771,2097792,2097798,2097800,2097818,2097909,2097950,2098012,2098052,2098078,2098304,2098356,2098422,2098575,2098656,2098748,2098749,2098771,2099096,2099114,2099216,2099261,2099305,2099315,2099369,2099438,2099474,2099475,2099532,2099610,2099621,2099674,2099683,2099686,2099699,2099737,2099753,2099803,2099839,2099859,2099879,2099894,2099896,2099991,2100026,2100034,2100063,2100078,2100087,2100106,2100115,2100258,2100285,2100312,2100324,2100389,2100410,2100832,2101116,2101568,2101828,2102310,2102314,2102346,2102357,2102358,2102360,2102362,2102368,2102385,2102389,2102401,2102403,2102445,2102557,2102561,2102593,2102632,2102656,2102755,2102789,2102921,2103090,2103110,2103160,2103170,2103195,2103202,2106298,2107621,2108071,2109923,2110893,2110895,2110898,2111510,2111550,2111706,2111707,2112604,2112612,2116338,2117084,2117209,2117484,2118413,2118494,2118827,2120985,2121508,2121515,2121518,2121521,2122190,2122238,2122315,2122326,2122583,2122614,2124029,2124166,2124228,2125481,2125504,2125712,2125732,2125757,2125774].each do |dealGroupId|
  form_data = {:sampleDealGroupId=>2096544,:targetDealGroupId=>dealGroupId}
  #beta.copySpecial(dealGroupId,form_data)
  beta.publish(dealGroupId)
end

