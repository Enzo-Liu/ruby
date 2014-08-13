require "open-uri"
require "net/https"
require "uri"
require "json"

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
    req["Content-Type"] = "application/x-www-form-urlencoded; charset=UTF-8"
    res = Net::HTTP.start(uri.host) do |http|
        http.request(req)
      end
  end

  adminMethodName={:submitProduce=>"/dealGroup/submitEditor",:publish=>"publish/fullPublish",:offline=>"admin/offline",:hide=>"admin/changeHideStatus"}

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

  def resync(dealGroupIds)
    uri = URI::parse(@domain+"backdoor/reSyncAndPublish?dealGroupIds=#{dealGroupIds}")
    puts "#{dealGroupIds}"+"--resync--"+getFromUri(uri).body
  end

  def extend(dealGroupId,toDate)
    uri = URI::parse(URI.encode(@domain+"action/test/modifyEndDate"))
    form_data={"json"=>"{\"DealGroupID\":#{dealGroupId},\"ReceiptEndDate\":\"#{toDate}\",\"BlackDates\":[]}"}
    puts uri.to_s
    postForm(uri,form_data)
  end

  def reSave(dealGroupId)
    uri = URI::parse(URI.encode(@domain+"dealGroup/loadPage?dealGroupId=#{dealGroupId}"))
    data = JSON.parse(getFromUri(uri).body)["msg"]
    newData = {}
    newData["type"] = "DealGroup.Edit"
    newData["children"]=data
    form_data={"dealGroupId"=>"#{dealGroupId}","data"=>newData.to_json}
    uri = URI::parse(URI.encode(@domain+"dealGroup/saveProperty"))
    puts postForm(uri,form_data).body
  end

  def getProcessStatus(procInstId)
    uri = URI::parse("http://wfapi.sys.www.dianping.com/Http/GetProcessComments.ashx?procInstIds=#{procInstId}&apikey=test")
    getFromUri(uri)
  end

  def publishTemplate(templateId)
    uri = URI::parse("http://apollo.51ping.com/aa/template/publish?templateId=#{templateId}")
    puts getFromUri(uri).body
  end
end


