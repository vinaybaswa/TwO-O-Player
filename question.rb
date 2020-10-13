def play
  puts "choose first number: "
  print "> "
  choice_one = $stdin.gets.chomp
  puts "choose second number: "
  print "> "
  choice_two = $stdin.gets.chomp
  puts "Now tell me, other player.. what is #{choice_one} + #{choice_two}?"
  print "> "
  answer = $stdin.gets.chomp
  if answer == choice_one + choice_two
    "next_round"
  else
    puts "lives - 1
    next_round"
  end
end

puts play