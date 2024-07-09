# frozen_string_literal: true

require_relative 'player'
require_relative 'human_player'

class Game # rubocop:disable Style/Documentation
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(name)
    @human_player = HumanPlayer.new(name)
    @enemies_in_sight = []
    @players_left = 10
    new_players_in_sight # To start with some enemies in sight
  end

  def kill_player(player)
    @enemies_in_sight.delete(player)
  end

  def is_still_ongoing? # rubocop:disable Naming/PredicateName
    @human_player.alive? && (@enemies_in_sight.any? || @players_left.positive?)
  end

  def show_players
    @human_player.show_state
    puts "Il reste #{@enemies_in_sight.count} ennemis en vue et #{@players_left} ennemis à éliminer."
  end

  def menu
    puts 'Quelle action veux-tu effectuer ?'
    puts 'a - chercher une meilleure arme'
    puts 's - chercher à se soigner'
    @enemies_in_sight.each_with_index do |enemy, index|
      puts "#{index} - attaquer #{enemy.name}" if enemy.alive?
    end
  end

  def menu_choice(choice) # rubocop:disable Metrics/MethodLength
    case choice
    when 'a'
      @human_player.search_weapon
    when 's'
      @human_player.search_health_pack
    else
      index = choice.to_i
      if index.between?(0, @enemies_in_sight.size - 1)
        enemy = @enemies_in_sight[index]
        @human_player.attacks(enemy)
        kill_player(enemy) unless enemy.alive?
      else
        puts 'Choix invalide'
      end
    end
  end

  def enemies_attack
    @enemies_in_sight.each { |enemy| enemy.attacks(@human_player) if enemy.alive? }
  end

  def end
    puts 'La partie est finie.'
    if @human_player.alive?
      puts 'Bravo ! Tu as gagné !'
    else
      puts 'Loser ! Tu as perdu !'
    end
  end

  def new_players_in_sight # rubocop:disable Metrics/MethodLength
    if @enemies_in_sight.size >= @players_left
      puts 'Tous les joueurs sont déjà en vue.'
      return
    end

    dice = rand(1..6)
    case dice
    when 1
      puts 'Aucun nouvel adversaire en vue.'
    when 2..4
      add_new_enemy
    when 5, 6
      add_new_enemy
      add_new_enemy
    end
  end

  private

  def add_new_enemy
    new_enemy = Player.new("joueur_#{rand(1000..9999)}")
    @enemies_in_sight << new_enemy
    puts "Un nouvel adversaire arrive en vue : #{new_enemy.name}."
  end
end
