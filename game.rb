require './player'

class Game

  attr_accessor :player_1, :player_2

  def initialize
    @players = [nil, nil]
    @round = 1
  end

  def next_round
    puts "-------------------"
    puts "\t round #: #{@round}"
    puts "-------------------"
    @round += 1
  end

  def display_status 
    puts "-------------------"
    puts "\t Game Status"
    puts "-------------------"
    @players.each { |player| puts "#{player.name} Lives: #{ player.dead ? "YOU DEAD" : player.lives}" }

    sleep 1
  end

  def winner
    winner = @players.find { |player| !player.dead }
    puts "Game Over, Winner: #{winner.name}" 
  end

  def game_over
    @players.any? { |player| player.dead }
  end

  def play
    puts "Welcome to TwO-O-Player"

    puts "First player, Enter your name:"
    print "> "
    @players[0] = Player.new($stdin.gets.chomp)
    puts "First player: #{@players[0].name}"

    puts "Second player, Enter your name:"
    print "> "
    @players[1] = Player.new($stdin.gets.chomp)
    puts "Second player: #{@players[1].name}"

    until(game_over) do

      # Player 1
      puts "\t #{@players[0].name} it's your turn"
      num_1 = rand(1...10)
      num_2 = rand(1...10)
      total = num_1 + num_2
      puts "What is #{num_1} plus #{num_2}"
      print "> "
      answer = $stdin.gets.chomp.to_i

      if (answer == total)
        puts "That is right! You live to see another day."
        display_status
      else
        puts "Sorry, wrong. remaining lives: #{@players[0].lost_a_life}"
        next_round
        display_status
      end

      # Player 2
      puts "\t #{@players[1].name} it's your turn"
      num_1 = rand(1...10)
      num_2 = rand(1...10)
      total = num_1 + num_2
      puts "What is #{num_1} plus #{num_2}"
      print "> "
      answer = $stdin.gets.chomp.to_i

      if (answer == total)
        puts "That is right! You live to see another day."
        display_status
      else
        puts "Sorry, wrong. remaining lives: #{@players[1].lost_a_life}"
        next_round
      end
      display_status
      winner

    end

  end

end

new_game = Game.new
new_game.play