require "pry"
class Vgpop::Gamescraper

   def initialize (url = nil)
     @url = url
     @doc = Nokogiri::HTML(open("#{url}"))
   end

   def scrape_game(input)
      game = Vgpop::Game.games[input.to_i- 1]
      game.desc = @doc.search("div.details").first.text.gsub("\r","").gsub("\t","").gsub("\n","").gsub(/^\s*/, '').strip
      game.reviews = @doc.search("td").search("a").first.text.scan(/\d/).join
      game.genre = @doc.search("#content").search(".crumbs").text.strip.split("\r\n » ")[1..].join(", ")
      game.release_date = @doc.search("body").search("b").last.text.scan(/:\s*\K.*/).join
   end


end
