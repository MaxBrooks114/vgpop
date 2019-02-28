class VgPop::CLI

  def call
    puts "Today's most popular video games:"
    list_vgs
    menu
  end

  def list_vgs
    @games = VgPop::Game.popular
 end

   def menu
     input = nil
     while input!= "exit"
       puts "You can enter the number of the game you are interested in to see information about it."
       puts "To see games by console enter the console you're interested in."
       puts "To see games by genre enter  the genre you're interested in."
       puts "To see the game with the best reviews enter best game."
       puts "To see the game with the worst reviews enter worst game"
       puts "Otherwise enter exit to leave"
        input = gets.strip.downcase
        case input
        when "1"
          puts "more info on videogame 1"
        when "2"
          puts "more info on videogame 2"
        when "list"
          list_vgs
        when "xbox one"
          puts "games on xbox one"
        when "action"
          puts "action games"
        when "best game"
          puts "game with highest reviews"
        when "worst game"
          puts "game with worst reviews"
        when "exit"
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
