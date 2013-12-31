require "open-uri"  
require "net/https"
require "uri"

#返回的cookie  
cookie =  'dpadmin=360cc4800098092534fa9aedb4a78bf0b33f67e84c35660076ba6c9eab84847e0d3614348edfa4d4a8bf630529b40a28322230194c2ac52ef51c2ba4f310b9b1; Domain=dper.com; Expires=Mon, 30-Dec-2013 22:38:45 GMT; JSESSIONID=EA9BE36A86DCE564D7ED47571E79D82C; '  
$headers = {"cookie"=>cookie}

def getFromUri(dealGroupId,uri,headers)
  req = Net::HTTP::Get.new(uri,headers) 
  res = Net::HTTP.start(uri.host) do |http|
      http.request(req)
  end
  return res
end
  
def postForm(dealGroupId,uri,headers)
  req = Net::HTTP::Post.new(uri,$headers)
  req.set_form_data(:statusId=>0,:isValid=>false,:dealGroupId=>dealGroupId) 
  res = Net::HTTP.start(uri.host) do |http|
      http.request(req)
    end
  return res;
end

def publish(dealGroupId)
  uri = URI::parse("http://tgplatform.sys.www.dianping.com/publish/fullPublish?dealGroupId=#{dealGroupId}")  
  res = getFromUri(dealGroupId,uri,$headers)
  puts "#{dealGroupId}"+res.body
end

def changeStatus(dealGroupId)
  uri = URI::parse("http://tgplatform.sys.www.dianping.com/operation/setStatusId")  
  res = postForm(dealGroupId,uri,$headers)
  puts "#{dealGroupId}"+"--status--"+res.body
end

def changeIsValid(dealGroupId)
  uri = URI::parse("http://tgplatform.sys.www.dianping.com/operation/setIsValid") 
  res = postForm(dealGroupId,uri,$headers)
  puts "#{dealGroupId}"+"--valid--"+res.body
end

# [0].each do |dealGroupId|
#   publish(dealGroupId)
# end
[2100131,2100133,2100137,2100139,2100144,2100145,2100148,2100150,2100172,2100174,2100185,2100189,2100192,2100201,2100204,2100206,2100207,2100208,2100213,2100427,2100428,2100432,2100438,2100441,2100452,2100470,2100480,2100481,2100506,2100510,2100528,2100537,2100544,2100562,2100576,2100586,2100589,2100613,2100640,2100651,2100655,2100680,2100709,2100714,2100717,2100732,2100740,2100741,2100742,2100743,2100744,2100745,2100746,2100747,2100748,2100749,2100750,2100751,2100752,2100753,2100754,2100755,2100756,2100757,2100758,2100759,2100760,2100761,2100763,2100774,2100780,2100782,2100789,2100790,2100826,2100834,2100852,2100868,2100894,2100911,2100925,2100926,2100931,2100943,2100965,2100966,2101021,2101072,2101075,2101168,2101171,2101172,2101173,2101175,2101176,2101177,2101179,2101181,2101182,2101183,2101184,2101185,2101186,2101187,2101188,2101189,2101190,2101192,2101193,2101194,2101195,2101196,2101197,2101198,2101199,2101200,2101201,2101202,2101203,2101204,2101205,2101206,2101207,2101208,2101209,2101210,2101211,2101212,2101213,2101214,2101215,2101216,2101217,2101218,2101219,2101224,2101241,2101242,2101244,2101245,2101246,2101247,2101248,2101249,2101250,2101251,2101252,2101253,2101254,2101255,2101256,2101257,2101258,2101259,2101260,2101261,2101262,2101263,2101264,2101265,2101266,2101267,2101268,2101269,2101270,2101271,2101272,2101289,2101290,2101291,2101292,2101293,2101294,2101295,2101306,2101316,2101332,2101352,2101355,2101362,2101367,2101400,2101417,2101431,2101432,2101446,2101501,2101502,2101506,2101554,2101559,2101561,2101562,2101564,2101579,2101585,2101595,2101598,2101599,2101600,2101601,2101602,2101603,2101616,2101622,2101623,2101624,2101625,2101626,2101627,2101628,2101629,2101644,2101654,2101655,2101664,2101669,2101678,2101688,2101694,2101697,2101700,2101732,2101741,2101748,2101749,2101750,2101753,2101754,2101757,2101759,2101763,2101766,2101772,2101775,2101777,2101778,2101780,2101781,2101784,2101787,2101789,2101790,2101791,2101797,2101802,2101821,2101823,2101824,2101825,2101841,2101853,2101859,2101860,2101861,2101862,2101863,2101865,2101866,2101867,2101868,2101869,2101870,2101871,2101872,2101873,2101874,2101875,2101876,2101878,2101897,2101903,2101907,2101927,2101929,2101933,2101934,2101936,2101942,2101957,2101959,2101961,2101963,2101971,2101973,2101979,2101981,2101983,2101987,2101988,2101989,2101990,2101999,2102021,2102031,2102068,2102098,2102100,2102143,2102144,2102169,2102188,2102194]
.each do |dealGroupId|
  changeStatus(dealGroupId)
  changeIsValid(dealGroupId)
end

