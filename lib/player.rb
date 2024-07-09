# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points_max = 10
    @life_points = @life_points_max
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage
    check_life_points
    print_death_message if death?
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}"
    damage = compute_damage
    puts "Il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
  end

  def death?
    @life_points <= 0
  end

  def alive?
    !death?
  end

  private

  def compute_damage
    rand(1..6)
  end

  def print_death_message
    puts "#{@name} a été tué"
  end

  def check_life_points
    @life_points = @life_points_max if @life_points > @life_points_max
    @life_points = 0 if death?
  end
end
