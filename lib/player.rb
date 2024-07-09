class Player
  # accesseur
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points -= damage.to_i
    print_is_death
  end

  def gets_damage_of(player)
    @life_points -= player.attack
    print_is_death_by(player)
  end

  def print_is_death
    puts "#{@name} a ete tuer" if @life_points <= 0
  end

  def print_is_death_by(player)
    puts "#{@name} a ete tuer par #{player.name}" if @life_points <= 0
  end
end