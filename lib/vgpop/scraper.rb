require "pry"
class Vgpop::Scraper

   def initialize (url= nil)
     @url = url
   end

   def scrape_game
    @doc = Nokogiri::HTML(open("https://www.gamerankings.com#{@url}"))
   end

   def scrape_desc
    scrape_game.search("div.details").text.gsub("\r","").gsub("\t","").gsub("\n","")
   end

   def scrape_reviews
    scrape_game.search("td").search("a").first.text.scan(/\d/).join
   end

   def scrape_genre
    scrape_game.search("#content").search(".crumbs").text.strip.split("\r\n » ")[1..].join(", ")
   end

   def scrape_release
    scrape_game.search("body").search("b").last.text.scan(/:\s*\K.*/).join
   end
    def scrape_gamerankings
      @doc= Nokogiri::HTML(open("https://www.gamerankings.com/"))
      @doc.search("table").first.search("tr").each do |tr|
          game = Vgpop::Game.new
          game.name = tr.text.gsub("\t","").gsub("\n","").gsub("\r","").scan(/\s(.*)/).join.scan(/^([^(]+)/).last.first.strip
          game.console = tr.text.scan(/\(([^\)]+)\)/).last.first
          game.score = tr.text.scan(/(\d\S*%)/).last.join
          game.url = tr.search("a").attr("href").text
          game.save
      end
    end


end
