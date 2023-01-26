require_relative '../lib/scrapping_bitcoin.rb'

describe "scraper" do
  it "create a list of crypto names" do
    expect(scraper("https://coinmarketcap.com/all/views/all/")).to eq("BTC")
  end
end