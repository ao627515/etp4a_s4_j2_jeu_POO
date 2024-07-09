# frozen_string_literal: true

require 'bundler'

Bundler.require

require_relative 'lib/game'

require_relative 'lib/player'

p1 = Player.new('José')
p2 = Player.new('Josiane')


binding.pry
