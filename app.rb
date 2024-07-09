# frozen_string_literal: true

require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/human_player'

# Méthode pour afficher le message de bienvenue
def welcome_message
  puts '------------------------------------------------'
  puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !     |"
  puts "|Le but du jeu est d'être le dernier survivant !|"
  puts '-------------------------------------------------'
end

# Méthode pour initialiser les joueurs
def initialize_players
  puts 'Quel est ton prénom ?'
  print '> '
  user_name = gets.chomp
  user = HumanPlayer.new(user_name)

  player1 = Player.new('Josiane')
  player2 = Player.new('José')
  enemies = [player1, player2]

  [user, enemies]
end

# Méthode pour afficher le menu d'actions
def display_menu(enemies)
  puts 'Quelle action veux-tu effectuer ?'
  puts 'a - chercher une meilleure arme'
  puts 's - chercher à se soigner'
  puts 'attaquer un joueur en vue :'
  enemies.each_with_index do |enemy, index|
    puts "#{index} - #{enemy.name} a #{enemy.life_points} points de vie" if enemy.alive?
  end
end

# Méthode pour gérer les actions de l'utilisateur
def handle_user_action(choice, user, enemies)
  case choice
  when 'a'
    user.search_weapon
    true
  when 's'
    user.search_health_pack
    true
  when '0'
    if enemies[0].alive?
      user.attacks(enemies[0])
      true
    else
      puts 'Choix invalide, essaie encore.'
      false
    end
  when '1'
    if enemies[1].alive?
      user.attacks(enemies[1])
      true
    else
      puts 'Choix invalide, essaie encore.'
      false
    end
  else
    puts 'Choix invalide, essaie encore.'
    false
  end
end

# Méthode pour gérer les attaques des ennemis
def enemies_attack(enemies, user)
  puts
  if enemies.any?(&:alive?)
    puts "Les autres joueurs t'attaquent !"
    enemies.each do |enemy|
      enemy.attacks(user) if enemy.alive?
      puts user.show_state
    end
  end
end

# Méthode pour afficher le message de fin de jeu
def end_game_message(user)
  puts 'La partie est finie'
  if user.alive?
    puts 'BRAVO ! TU AS GAGNE !'
  else
    puts 'Loser ! Tu as perdu !'
  end
end

# Début du jeu
welcome_message
user, enemies = initialize_players

# Boucle de combat
until user.death? || enemies.all?(&:death?)
  # Afficher l'état du joueur
  puts
  user.show_state
  puts

  valid_action = false
  until valid_action
    display_menu(enemies)

    # Saisie de l'utilisateur
    print '> '
    choice = gets.chomp
    valid_action = handle_user_action(choice, user, enemies)
    puts unless valid_action
  end

  enemies_attack(enemies, user)

  # Pause pour mieux lire l'affichage
  puts 'Appuyez sur Enter pour continuer...'
  gets.chomp
  puts
end

# Fin du jeu
end_game_message(user)
