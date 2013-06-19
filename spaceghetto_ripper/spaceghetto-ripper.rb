require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://www.spaceghetto.st"))   
imglinks = page.css(".content img")

imglinks.each do |link| 
  filename = File.basename(link['src'])  
  open(filename, 'wb') do |file|
    file << open(link['src']).read
  end
end

sleep(3)