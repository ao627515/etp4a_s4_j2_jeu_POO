require 'bundler'
Bundler.require

require_relative 'lib/game'

puts "Bienvenue sur 'ILS VEULENT TOUS MA POO' !"
puts "Le but du jeu est d'être le dernier survivant !"

print 'Quel est ton nom de joueur ? '
player_name = gets.chomp

my_game = Game.new(player_name)

puts '-----------------------------------------------------------------'
while my_game.is_still_ongoing?
  my_game.new_players_in_sight
  my_game.show_players
  my_game.menu
  print '> '
  choice = gets.chomp
  my_game.menu_choice(choice)
  my_game.enemies_attack if my_game.is_still_ongoing?
  puts '-----------------------------------------------------------------'
end

my_game.end
