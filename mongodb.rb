require 'rubygems'  # not necessary for Ruby 1.9
require 'mongo'

#make a connection
db = Mongo::Connection.new("10.1.77.13",27017).db("dolphin_log")
#look at collections
	db.collection_names.each { |name| puts name }
	coll = db.collection("dolphin_log")
#count documents in a collection
	puts coll.count()
  #coll.drop(); 
  #query with regex
  coll.find("btype"=>"ProductCenter").sort({"gt"=>-1}).limit(1000).each {|row| p row}
