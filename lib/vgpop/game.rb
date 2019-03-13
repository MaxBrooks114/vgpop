class Vgpop::Game

   attr_accessor :name, :console, :score, :desc, :genre, :reviews, :release_date, :url, :purchase_url


  @@games=[]

  def save
    @@games << self
  end


 def self.games
    @@games
  end




end
