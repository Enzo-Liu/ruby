require 'savon'

class Workflow
  def initialize
    # create a client for the service
    @client = Savon.client(wsdl: 'http://wfapi.sys.www.dianping.com/webservice/workflowservice.asmx?wsdl',log_level: :info,log: false)
  end

  #Savon.client(log: false)

  def getTaskListParam(loginId,procInstanceId)
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
          'LoginId'=> loginId,
          'ProcInstId'=> {'int'=>procInstanceId}
        }
      },
      'apikey'=> 'test'
    }
  end

  def getProcessParam(procInstanceId) 
    getProcessStatus = 
    { 
      'procInstId' => procInstanceId,
      'apikey'=> 'test'
    }
  end

  def changePageIndex(request,index)
    request['queryPara']['PagingInfo']['PageIndex'] = index
  end

  def getApproveParam(sn,loginId)
    approve = 
    {
      'sn' => sn,
      'loginId' => loginId,
      'actionString' => '同意',
      'apikey' => 'test'
    }
  end
  def approve(sn,loginId)
    @client.call(:approve, message: getApproveParam(sn,loginId))
  end

  def getProcessStatus(procInstanceId)
    @client.call(:get_process_status,message: getProcessParam(procInstanceId)).body[:get_process_status_response][:get_process_status_result][:k2_status_dto]
  end

  def getTaskList(loginId,procInstanceId)
    @client.call(:get_task_list,message: getTaskListParam(loginId,procInstanceId)).body[:get_task_list_response][:get_task_list_result][:result_list][:my_task_dto][:sn]
  end

  def finWorkflow(procInstanceId)
    task_dto = getProcessStatus(procInstanceId)
    activity = task_dto[:activity]
    while (!activity.eql?'流程结束') do
      task_dto = getProcessStatus(procInstanceId)
      activity = task_dto[:activity]
      puts task_dto.inspect
      loginId = task_dto[:login_ids][:int]
      if(Array.try_convert(loginId)!=nil)
        loginId = loginId[0]
      end
      sn = getTaskList(loginId,procInstanceId)
      approve(sn,loginId)
      puts sn
    end
  end

end

workflow = Workflow.new()
[1084992,1084993,1105695,1105696].each do |procInstanceId|
  workflow.finWorkflow(procInstanceId)
end

