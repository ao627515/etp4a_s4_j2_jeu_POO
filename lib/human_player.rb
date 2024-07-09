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

  private

  def compute_damage
    rand(1..6) * @weapon_level
  end
end
