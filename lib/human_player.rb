# frozen_string_literal: true

require_relative 'player'

class HumanPlayer < Player # rubocop:disable Style/Documentation
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points_max = 100
    @life_points = @life_points_max
    @weapon_level = 1
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    if new_weapon_level > @weapon_level
      puts 'Bravo ! Tu prends cette arme.'
      @weapon_level = new_weapon_level
    else
      puts 'Mauvais choix...'
    end
  end

  def search_health_pack # rubocop:disable Metrics/MethodLength
    health_pack_chance = rand(1..6)
    case health_pack_chance
    when 1
      puts 'Tu n\'as rien trouvé...'
    when 2..5
      puts 'Bravo, tu as trouvé un pack de +50 points de vie !'
      @life_points += 50
    when 6
      puts 'Waow, tu as trouvé un pack de +80 points de vie !'
      @life_points += 80
    end
    check_life_points
  end

  private

  def compute_damage
    rand(1..6) * @weapon_level
  end
end
