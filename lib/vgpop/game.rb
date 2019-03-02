class Vgpop::Game

   attr_accessor :name, :console, :genre, :score, :reviews, :price, :url, :desc

  def self.popular
    #scrape gamerankings.com to return 10 most popular games
    self.scrape_games
  end


  def self.scrape_games
    games=[]
    games << self.scrape_gamerankings
  end

  def self.scrape_gamerankings
    doc= Nokogiri::HTML(open("https://www.gamerankings.com/"))
    games= doc.search("tr").text.split("\r\n\t\t")
    games.map!{|game| game.gsub("\t","")}.delete("")
    popular_games = games[0,21]
    popular_games_names_consoles = popular_games.map{|game|
                               if game.index(". ") != nil
                                game[3..game.length]
                               end}.compact
    popular_games_names = popular_games_names_consoles.map{|game| game.sub /\s*\(.+\)$/, ''}



    game= self.new
    game.name=
    binding.pry


  end

end
