class Vgpop::Game

   attr_accessor :name, :console, :score, :desc, :genre, :reviews, :release_date, :url, :purchase_url


  @@games=[]

  def save
    @@games << self
  end


 def self.games
    @@games
  end

  def self.clear_all
    @@games.clear
  end

 def sort_by_name
    @@games.sort_by {|game| game.name}.each {|game| puts "#{game}"}

 end

end
