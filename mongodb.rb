require 'rubygems'  # not necessary for Ruby 1.9
require 'mongo'

#make a connection
db = Mongo::Connection.new("10.1.77.13",27017).db("dolphin_log")
#look at collections
	db.collection_names.each { |name| puts name }
	coll = db.collection("dolphin_log")
#count documents in a collection
	puts coll.count()
#query with regex
  coll.find("memo"=>/500/).sort({"gt"=>-1}).limit(5).each {|row| p row}
