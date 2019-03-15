require "pry"
class Vgpop::CLI

  def call
    Vgpop::Scraper.new.scrape_gamerankings
    list_vgs
    menu
  end

  def list_vgs
    puts "============================================================="
    puts "The current most popular games according to gamerankings.com"
    puts "============================================================="
    @games = Vgpop::Game.games
    @games.each.with_index(1) do |game, i|
      puts "--#{i}. #{game.name}"
    end
    puts "============================================================="
  end

   def menu
     input = nil
     while input!= "exit"
       puts "You can:"
       puts "-- Enter the number of the game in this list to see information about it".gsub(/^\s*/, '')
       puts "-- Or to see the list again enter \'list\'"
       puts "-- Otherwise to exit the CLI enter \'exit\'"
       puts "============================================================="
        input = gets.strip.downcase
        case input
        when "#{input.to_i}"
          if @games[input.to_i- 1] != nil && input.to_i != 0
           game = @games[input.to_i- 1]
           Vgpop::Gamescraper.new.scrape_game(game.url,input)
           puts"---------------------------------"
           puts "#{game.name}"
           puts"---------------------------------"
           puts "Console: #{game.console}
           Genre: #{game.genre}
           Aggregated review score: #{game.score}
           No. reviews: #{game.reviews}
           Release date: #{game.release_date}".gsub(/^\s*/, '').strip
           puts "--------------------------------"
           puts "#{game.desc}"
           puts "--------------------------------"
           puts "Would you like to purchase this game? If so, type \'yes\'"
           puts "or enter anything to bring up the menu"
           puts "--------------------------------"
           choice = gets.strip.downcase
           case choice
            when "yes"
              if Launchy::Application::Browser.new.app_list !=[]
                Launchy.open("#{game.purchase_url}")
              else
                 puts "Your IDE does not support this functionality, please copy and paste this url into your browser #{game.purchase_url}"
              end
            end
          else
           confused(input)
          end
        when "list"
          list_vgs
        when  "exit"
          goodbye
        else
          confused(input)
        end
      end
    end

   def confused(input)
     puts "User used #{input}, it wasn't very effective."
   end

   def goodbye
    puts "See you later, gamer!"
    puts "--------------------------------"
   end




end
