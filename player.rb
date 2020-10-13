class Player

  attr_reader :name
  attr_accessor :lives

  def initialize(name)
    @name = name
    @lives = 3
  end

  def lost_a_life
    self.lives -= 1
  end

  def dead
    self.lives <= 0
  end
end

# player_1 = Player.new("Player_1")
# player_2 = Player.new("Player_2")


# puts player_1.name, player_1.lives

# player_1.lost_a_life
# puts player_1.name, player_1.lives, player_1.dead
