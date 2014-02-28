require 'anemone'

Anemone.crawl("http://shibeike.com/explorer/") do |anemone|
  anemone.on_every_page do |page|
      puts page.marshal_dump()
  end
end
