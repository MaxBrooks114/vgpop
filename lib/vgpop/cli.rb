class Vgpop::CLI

  def call
    list_vgs
    menu
  end

  def list_vgs
    puts "Today's most popular video games:"
    @games = Vgpop::Game.popular
    @games.each.with_index(1) do |game, i|
      puts "#{i}. #{game.name}"
    end
  end

   def menu
     input = nil
     while input!= "exit"
       puts "You can enter the number of the game you are interested in to see information about it."
       puts "To see games by console enter the console you're interested in."
       puts "To see games by genre enter the genre you're interested in."
       puts "To see the game with the best reviews enter best game."
       puts "To see the game with the worst reviews enter worst game"
       puts "Otherwise enter exit to leave"
        input = gets.strip.downcase
        case input
        when "#{input.to_i}"
         game = @games[input.to_i- 1]
           puts "#{game.name}
           Console: #{game.console}
           Genre: #{game.genre}
           Aggregated review score:#{game.score}
           No. reviews: #{game.reviews}
           Price(usd): #{game.price}
           Purchase url: #{game.url}
           #{game.desc}".gsub /^\s*/, ''
        when  "console"
          puts "games on that console"
        when  "action"
          puts "action games"
        when  "best game"
          puts "game with highest reviews"
        when "worst game"
          puts "game with worst reviews"
        when "list"
          list_vgs
        when  "exit"
          goodbye
        else
          puts "what you talkin bout bro"
        end
      end
    end

  def goodbye
    puts "See you later, gamer!"
  end

end
