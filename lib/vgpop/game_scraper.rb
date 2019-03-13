class Vgpop::Gamescraper

   def scrape_game (url, input)
     @doc = Nokogiri::HTML(open("#{url}"))
     game = Vgpop::Game.games[input.to_i- 1]
     game.desc = @doc.search("div.details").first.text.chop.gsub(/^\s*/, '').strip
     game.reviews = @doc.search("td").search("a").first.text.scan(/\d/).join
     game.genre = @doc.search("#content").search(".crumbs").text.strip.split("\r\n » ")[1..].join(", ")
     game.release_date = @doc.search("body").search("b").last.text.scan(/:\s*\K.*/).join
   end


end
