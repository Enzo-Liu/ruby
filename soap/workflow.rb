require 'savon'

class Workflow
  def initialize
    # create a client for the service
    @client = Savon.client(wsdl: 'http://wfapi.sys.www.dianping.com/webservice/workflowservice.asmx?wsdl',log_level: :debug,log: true,env_namespace: :soap,soap_version: 2)
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
        'apiKey'=> 'test'
    }
  end

  def getProcessParam(procInstanceId)
    getProcessStatus =
      {
      'procInstId' => procInstanceId,
      'folio' => '',
      'apiKey'=> 'test'
    }
  end

  def changePageIndex(request,index)
    request['queryPara']['PagingInfo']['PageIndex'] = index
  end

  def getApproveParam(sn,loginId,actionString)
    approve =
      {
      'sn' => sn,
      'loginId' => loginId,
      'actionString' => actionString,
      'apiKey' => 'test'
    }
  end
  def approve(sn,loginId,actionString)
    @client.call(:approve, message: getApproveParam(sn,loginId,actionString))
  end

  def getProcessStatus(procInstanceId)
    @client.call(:get_process_status,message: getProcessParam(procInstanceId)).body[:get_process_status_response][:get_process_status_result][:k2_status_dto]
  end

  def getTaskList(loginId,procInstanceId)
    @client.call(:get_task_list,message: getTaskListParam(loginId,procInstanceId)).body[:get_task_list_response][:get_task_list_result][:result_list][:my_task_dto]
  end

  def getLoginIdByTaskDto(task_dto)
      loginId = task_dto[:login_ids][:int]
      if(Array.try_convert(loginId)!=nil)
        loginId = loginId[0]
      end
      loginId
  end
  def finWorkflow(procInstanceId)
    task_dto = getProcessStatus(procInstanceId)
    activity = task_dto[:activity]
    while (!activity.eql?'流程结束') do
      task_dto = getProcessStatus(procInstanceId)
      activity = task_dto[:activity]
      loginId = getLoginIdByTaskDto(task_dto)
      puts task_dto.inspect
      sn = getTaskList(loginId,procInstanceId)[:sn]
      approve(sn,loginId,'同意')
      puts sn
    end
  end
  def getReassignParam(sn,fromLoginId,toLoginId,toName)
    reAssignTask =
    {
      'sn' => sn,
      'assignFromLoginId' => fromLoginId,
      'assignFromRealName' => '管理员',
      'assignToLoginId' => toLoginId,
      'assignToRealName' => toName,
      'isAddLog' => true,
      'apiKey' => 'test',
    }

  end

  def reject(procInstanceId,status)
    task_dto = getProcessStatus(procInstanceId)
    fromLoginId = getLoginIdByTaskDto(task_dto)
    puts task_dto.inspect
    sn = getTaskList(fromLoginId,procInstanceId)[:sn]
    actionString = status ? "打回AE" : "同意"
    approve(sn,fromLoginId,actionString)
  end
  def reassign(procInstanceId,toLoginId,toName)
    task_dto = getProcessStatus(procInstanceId)
    fromLoginId = getLoginIdByTaskDto(task_dto)
    puts task_dto.inspect
    sn = getTaskList(fromLoginId,procInstanceId)[:sn]
    @client.call(:re_assign_task,message: getReassignParam(sn,fromLoginId,toLoginId,toName))
  end
end

workflow = Workflow.new()
data = File.open('/home/vagrant/host/Desktop/full_handle.txt')
data.each do |procInstId|
  procInstId = procInstId.strip!||procInstId
  workflow.reject(procInstId,true)
end
