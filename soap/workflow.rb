require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'http://wfapi.sys.www.dianping.com/WebService/WorkFlowService.asmx?wsdl',log_level: :info,log: false)

#Savon.client(log: false)

getTaskListParam = 
{ 'queryPara' => 
  {'PagingInfo' => 
    {
      'PageSize'=> 10,
      'PageIndex'=> 1,
      'SortOrder'=> 'Ascending'
      },
    'QueryCriteria'=> 
    {
      'LoginId'=> 10000,
      'TaskStartDate'=>
      {
        'DateFrom'=>'2013-12-24T00:00:00.00',
        'DateTo'=>'2013-12-25T00:00:00.00'
      }
    }
  },
  'apikey'=> 'test'
}

def getProcessParam(dealGroupId) 
  getProcessStatus = 
  { 
    'procInstId' => dealGroupId,
    'apikey'=> 'test'
  }
end

def changePageIndex(request,index)
  request['queryPara']['PagingInfo']['PageIndex'] = index
end


[].each do |dealGroupId|
  response = client.call(:get_process_status,message: getProcessParam(dealGroupId))
  task_dto= response.body[:get_process_status_response][:get_process_status_result][:k2_status_dto]
  puts "dealGroupId is #{dealGroupId},folio is #{task_dto[:folio]}, activity is #{task_dto[:activity]}" if task_dto[:folio]!=nil
end

# response = client.call(:get_task_list,message: getTaskListParam)
# pageCount = response.body[:get_task_list_response][:get_task_list_result][:paging_info][:page_count]
# 
# #puts response.body[:get_task_list_response][:get_task_list_result][:result_list][:my_task_dto][0]
# # {:proc_inst_id=>"862677", :sn=>"862677_23", :url=>"/#!/admin/deal-group/edit/Processing.aspx?SN=862677_23", :folio=>"80090000000hZBWAA2,2089014", :originator_login_id=>"-26317", :process_code=>"PCTGOrderProduce", :task_start_date=>#<DateTime: 2013-12-24T17:51:53+00:00 ((2456651j,64313s,103000000n),+0s,2299161j)>, :process_start_date=>#<DateTime: 2013-12-24T16:47:37+00:00 ((2456651j,60457s,757000000n),+0s,2299161j)>}
# def handleItem(item)
#   puts item.inspect
# end
# 
# 
# 1.upto(pageCount.to_i) do |i|
#   changePageIndex(getTaskListParam,i)
#   response = client.call(:get_task_list,message: getTaskListParam)
#   body = response.body
#   result = body[:get_task_list_response][:get_task_list_result]
#   resultList = result[:result_list][:my_task_dto] if result[:result_list]!=nil
#   pageInfo = result[:paging_info]
#   resultList.each{|item|
#     handleItem(item)
#   }
#   
# end

