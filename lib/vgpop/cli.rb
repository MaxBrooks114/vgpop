class Vgpop::CLI

  def call
    Vgpop::Scraper.new.scrape_gamerankings
    list_vgs
    menu
  end

  def list_vgs
    puts "The current most popular games according to gamerankings.com:"
    @games = Vgpop::Game.games
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
    end
  end

   def menu
     input = nil
     while input!= "exit"
       puts "You can enter the number of the game you are interested in to see information about it."
       puts "To see the list again enter list"
       puts "Otherwise enter exit to leave"
        input = gets.strip.downcase
        case input.downcase
        when "#{input.to_i}"
          if @games[input.to_i- 1] != nil
           game = @games[input.to_i- 1]
           puts "#{game.name}
           Console: #{game.console}
           Genre: #{game.genre}
           Aggregated review score:#{game.score}
           No. reviews: #{game.reviews}
           Release date: #{game.release_date}
           #{game.desc}".gsub /^\s*/, ''
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
  end




end
