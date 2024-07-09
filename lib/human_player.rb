# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player # rubocop:disable Style/Documentation
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def search_weapon
    weapon_level = rand(0..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level}"
    if weapon_level > @weapon_level
      puts 'Bravo ! Tu prends cette arme.'
      @weapon_level = weapon_level
    else
      puts 'Mauvais choix...'
    end
  end

  def search_health_pack # rubocop:disable Metrics/MethodLength
    rand = rand(0..5)
    health_pack = 0
    prefix = ''
    if rand == 1
      puts 'Tu n\'as rien trouvé...'
    else
      if rand >= 2 && rand <= 5
        health_pack = 50
        prefix = 'Bravo'
      elsif rand == 6
        health_pack = 80
        prefix = 'Waow'
      end
      puts "#{prefix}, tu as trouvé un pack de +#{health_pack} points de vie !"
    end

    
    life_points_integrity(100)
  end

  private

  def compute_damage
    rand(1..6) * @weapon_level
  end
end
