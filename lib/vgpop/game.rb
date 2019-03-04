class Vgpop::Game

   attr_accessor :name, :console, :score, :desc, :genre, :reviews, :release_date, :url


  @@games=[]

  def save
    @@games << self
  end



 def desc
   @desc || Vgpop::Scraper.new(url).scrape_desc
 end

 def genre
   @genre || Vgpop::Scraper.new(url).scrape_genre
 end

 def reviews
   @reviews || Vgpop::Scraper.new(url).scrape_reviews
 end

 def release_date
   @release_date || Vgpop::Scraper.new(url).scrape_release
 end

  def self.games
    @@games
  end




end
