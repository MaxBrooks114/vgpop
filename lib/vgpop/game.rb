class Vgpop::Game

   attr_accessor :name, :console, :genre, :score, :reviews, :price, :url, :desc

  def self.popular
    #scrape gamerankings.com to return 10 most popular games
    self.scrape_game
  end


  def self.scrape_games
    games=[]
    games << self.scrape_gamerankings
  end

  def self.scrape_gamerankings
    doc= Nokogiri::HTML(open("https://www.gamerankings.com/"))
  end

end
