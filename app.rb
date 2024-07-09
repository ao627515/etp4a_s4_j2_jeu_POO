# frozen_string_literal: true

require 'bundler'

Bundler.require

require_relative 'lib/game'

require_relative 'lib/player'

require_relative 'lib/human_player'

# josiane = Player.new('Josiane')
# jose = Player.new('José')

# puts "Voici l'état de chaque joueur :"

# josiane.show_state
# jose.show_state

# puts "Passons à la phase d'attaque :"

# while jose.life_points.positive? || josiane.life_points.positive?
#   josiane.attacks(jose)
#   break if jose.life_points.zero?

#   puts '----------------------'
#   jose.attacks(josiane)
#   puts '----------------------'
# end

ph1 = HumanPlayer.new('az')

binding.pry

