require "./http.rb"
require 'json'

class Online
  def initialize
    @domain ="http://tgplatform.sys.www.dianping.com/"
    @headers = {"cookie"=>'dpadmin=ada367cbb585808b826315e57baa3720010dadd3498029e9651b50484db82dc3a4e537e2e4bc6eb71d6b52b16d657f8d80a5df7619d6a273120b063ad757967e;'}
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
dMap = {}
beta = Online.new
parse = Proc.new {|stId,dtId|
  #form_data = {:sampleDealGroupId=>2096544,:targetDealGroupId=>dealGroupId}
  #beta.copySpecial(dealGroupId,form_data)
  if dMap[dtId]== nil
    uri = URI::parse("http://tgplatform.sys.www.dianping.com/document/getTemplateInfo?templateId=#{dtId}&dealGroupId=2000001") 
    body = JSON.parse(beta.getFromUri(uri).body)
    dMap[dtId] = body
  else
    body = dMap[dtId]
  end
  proc = Proc.new{|json| 
    case json
    when Hash
       puts "statementTemplateID:#{json["data"]["statementTemplateId"]}"+json.to_s if json["data"] && json["data"]["statementTemplateId"] &&  json["data"]["statementTemplateId"]==stId.to_i
    else
    end
  }
  JSON.recurse_proc(body,&proc)
}

text = File.open("/Users/liuenze/Desktop/query_result.csv").read 
text.gsub!(/\r\n?/,"\n")
text.each_line do |line|
    s = line.to_s
    ss = s.split(",")
    stId = ss[2]
    dtId = ss[1].chomp()
    puts "#{ss[0]},#{stId},#{dtId},#{ss[3].chomp()}"
    parse.call(stId,dtId)
end 

