class Vgpop::Game

   attr_accessor :name, :console, :genre, :score, :reviews, :price, :url, :desc


  @@games=[]

  def initialize(name)
    @name=name
    @@games << self
  end

  def self.games
    @@games
  end


  def self.scrape_gamerankings
    doc= Nokogiri::HTML(open("https://www.gamerankings.com/"))
    games= doc.search("tr").text.strip.split("\r\n\t\t")
    games.map!{|game| game.gsub("\t","")}.delete("")
    popular_games = games[0,21]
    popular_g_n_c = popular_games.map{|game| if game.index(". ") != nil
                                                 game[3..game.length]
                                               end}.compact
    popular_games_names = popular_g_n_c.map{|game| game.strip.sub /\s*\(.+\)$/, ''}

    binding.pry
  end




end
