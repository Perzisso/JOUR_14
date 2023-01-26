require 'rspec'
require 'pry'
require 'rubocop'
require 'nokogiri'
require 'open-uri'

def scraper(url)
  # Open and parse a url
  page = parsed_page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
# Creating a name list

name_currency = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol"]')
name_currency_array = []

  name_currency.each do |element|
    name_currency_array << element.text
  end
  # puts name_currency_array
  
  # Creating a price list

  price_currency = page.xpath('//td[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
  price_currency_array = []

    price_currency.each do |element|
      price_currency_array << element.text
    end
    # puts price_currency_array
  

  # Hash 2 lists
  
  name_price = Hash[name_currency_array.zip(price_currency_array)]
  puts name_price.inspect

end
url = "https://coinmarketcap.com/all/views/all/"
scraper(url)
