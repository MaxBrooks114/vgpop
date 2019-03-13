class Vgpop::Game

<<<<<<< HEAD
   attr_accessor :name, :console, :score, :desc, :genre, :reviews, :release_date, :url, :purchase_url
=======
   attr_accessor :name, :console, :score, :desc, :genre, :reviews, :release_date, :url, , :purchase_url
>>>>>>> 2a2ed52be646a9bcc412235c78c89d46d6472437


  @@games=[]

  def save
    @@games << self
  end


 def self.games
    @@games
  end




end
