require "pry"
class Vgpop::Scraper

    def scrape_gamerankings
      @doc= Nokogiri::HTML(open("https://www.gamerankings.com/"))
      @doc.search("table").first.search("tr").each do |tr|
        #binding.pry
          game = Vgpop::Game.new
          game.name = tr.text.gsub("\t","").gsub("\n","").gsub("\r","").scan(/\s(.*)/).join.scan(/^([^(]+)/).last.first.strip
          game.console = tr.text.scan(/\(([^\)]+)\)/).last.first
          game.score = tr.text.scan(/(\d\S*%)/).last.join
          game.save
      end
    end


end
