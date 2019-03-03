class Vgpop::Game

   attr_accessor :name, :console, :genre, :score, :reviews, :price, :url, :desc




  def initialize(name, console=nil, score=nil)
    @name = name
    @console = console
    @score = score
    #@@games << self
  end

  def self.games
    self.scrape_names
  end

  def self.scrape_gamerankings
    doc= Nokogiri::HTML(open("https://www.gamerankings.com/"))
    games= doc.search("tr").text.split("\r\n\t\t")
    games.map!{|game| game.gsub("\t","").strip}.reject(&:empty?)
  end

  def self.scrape_names
    popular_games = self.scrape_gamerankings[0,21].map{|game| if game.index(". ") != nil
      game[3..game.length].strip
    end}.compact
    popular_games_names = popular_games.map{|game| game.strip.sub /\s*\(.+\)$/, ''}
  end

  def self.create_games_by_name
    self.scrape_names.map{|game| self.new(game)}
  end

  def self.scrape_consoles
    popular_games = self.scrape_gamerankings[0,21].map{|game| if game.index(". ") != nil
      game[3..game.length].strip
    end}.compact
    popular_games_consoles = popular_games.collect{|game| game.scan(/\(([^\)]+)\)/).last.first}
  end

  def self.add_consoles
      self.create_games_by_name.each do |game|
            counter = 0
            game.console= self.scrape_consoles[counter]
            counter +=1 
    end
 end


  #   reviews= games.map{|game| game.scan(/(\d\S*%)/).last}.compact.join(" ").split
  #   popular_reviews= reviews[0,10]
  #   binding.pry
  # end



end
