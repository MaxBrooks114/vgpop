class Vgpop::Game

   attr_accessor :name, :console, :score


  @@games=[]

  def save
    @@games << self
  end

  def self.games
    @@games
  end




end
