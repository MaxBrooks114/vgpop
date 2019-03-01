class Vgpop::Game
   attr_accessor :name, :console, :genre, :score, :reviews, :price, :url, :desc

  def self.popular
    #return 10 most popular games
    puts <<-DOC
      1. Super Smash Bros. Ultimate
      2. Kingdom Hearts III
      3. Resident Evil 2
      4. Apex Legends
      5. Jump Force
      6. Tales of Vesperia: Definitive Edition
      7. Yakuza Kiwami
      8. Etrian Odyssey Nexus
      9. Anthem
     10. God Eater
    DOC

    game_1= Game.new
    game_1.name= "Super Smash Bros. Ultimate"
    game_1.console= "Nintendo Switch"
    game_1.genre= "Action, Fighting"
    game_1.score= "92.17%"
    game_1.reviews= "47"
    game_1.price= "$59.99"
    game_1.url=  "https://www.gamestop.com/nintendo-switch/games/super-smash-bros-ultimate/159620"
    game_1.desc= "Legendary game worlds and fighters collide in the ultimate showdown-
    a new entry in the Super Smash Bros. series for the Nintendo Switch system!
    New fighters like Inkling from the Splatoon Series and
    Ridley from the Metroid series, make their Super Smash Bros. series debut along side every
    Super Smash Bros. fighter in the series... EVER! Faster combat, new items, new attacks,
    new defensive options and more will keep the battle raging whether you're at home or on the go."

    game_2= Game.new
    game_2.name= "Kingdom Hearts III"
    game_2.console= "PS4"
    game_2.genre= "Role-Playing, Action RPG"
    game_2.score= "82.90%"
    game_2.reviews= "39"
    game_2.price= "$59.99"
    game_2.url=  "https://www.gamestop.com/ps4/games/kingdom-hearts-iii/150783"
    game_2.desc= "KINGDOM HEARTS III features a mature Sora as the main protagonist who sets forth on an adventure with Mickey,
    Donald and Goofy through new and legendary Disney worlds. KINGDOM HEARTS III will make full use of next generation console technologies
    to showcase a stunning universe packed full of worlds based on Disney properties."

    [game_1, game_2]
  end
end
