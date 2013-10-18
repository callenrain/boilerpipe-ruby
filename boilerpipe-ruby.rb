module BoilerpipeRuby
	def self.extract(extract_url)
		begin
			html_string = String.new(open(extract_url).read)
			article_text = ArticleExtractor.INSTANCE.getText(html_string)
			htmlDoc = HTMLFetcher.fetch(Url.new(extract_url))
        	doc = BoilerpipeSAXInput.new(htmlDoc.toInputSource).getTextDocument
			article_title = doc.getTitle
			return {:text => article_text, :title => article_title}
		rescue Exception => e 
			puts "RETURN ERROR"
      		return Hash[:error => e.message]
    	end
	end
end
