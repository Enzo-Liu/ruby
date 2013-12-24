require 'savon'

# create a client for the service
client = Savon.client(wsdl: 'http://wfapi.sys.www.dianping.com/WebService/WorkFlowService.asmx?wsdl',log_level: :info,log: false)

#Savon.client(log: false)

getTaskListParam = { 'queryPara' => 
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
                  'DateFrom'=>'2013-12-23T00:00:00.00',
                  'DateTo'=>'2013-12-25T00:00:00.00'
                }
              }
            },
            'apikey'=> 'test'
          }

def changePageIndex(request,index)
  request['queryPara']['PagingInfo']['PageIndex'] = index
end

response = client.call(:get_task_list,message: getTaskListParam)
pageCount = response.body[:get_task_list_response][:get_task_list_result][:paging_info][:page_count]

#puts response.body[:get_task_list_response][:get_task_list_result][:result_list][:my_task_dto][0]
# {:proc_inst_id=>"862677", :sn=>"862677_23", :url=>"/#!/admin/deal-group/edit/Processing.aspx?SN=862677_23", :folio=>"80090000000hZBWAA2,2089014", :originator_login_id=>"-26317", :process_code=>"PCTGOrderProduce", :task_start_date=>#<DateTime: 2013-12-24T17:51:53+00:00 ((2456651j,64313s,103000000n),+0s,2299161j)>, :process_start_date=>#<DateTime: 2013-12-24T16:47:37+00:00 ((2456651j,60457s,757000000n),+0s,2299161j)>}
def handleItem(item)
  puts item[:sn]
end


1.upto(pageCount.to_i) do |i|
  changePageIndex(request,i)
  response = client.call(:get_task_list,message: request)
  body = response.body
  result = body[:get_task_list_response][:get_task_list_result]
  resultList = result[:result_list][:my_task_dto] if result[:result_list]!=nil
  pageInfo = result[:paging_info]
  resultList.each{|item|
    handleItem(item)
  }
  
end

