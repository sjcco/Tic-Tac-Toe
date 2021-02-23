#!/usr/bin/env ruby
require_relative '../lib/display'
require_relative '../lib/game'
require_relative '../lib/board'
require 'colorize'

puts intro.green
gets
display_clear
puts display_rules.yellow

gets
display_clear

player1 = ''
while player1.empty?
  puts display_name1_prompt.blue
  player1 = gets.chomp
end
player2 = ''
while player2.empty?
  puts display_name2_prompt.red
  player2 = gets.chomp
  player2 = '' if player1 == player2
end
display_clear
print display_symbol_banner
sleep 2
display_clear
puts '                                READY'
sleep 0.7
display_clear
puts '                                 SET'
sleep 0.7
display_clear
puts '                                  GO'
sleep 0.7
<<<<<<< Updated upstream
system('clear') || system('cls')

9.times do
  player1_turn = true
  while player1_turn
    puts "      #{player1} pick a cell".blue
    board
    cell = gets.chomp
    system('clear') || system('cls')
    puts 'not in range' unless cell.to_i.between?(1, 9)
    player1_turn = false if cell.to_i.between?(1, 9)
  end
  player2_turn = true
  while player2_turn
    puts "      #{player2} pick a cell".red
    board
    cell = gets.chomp
    system('clear') || system('cls')
    puts 'not in range' unless cell.to_i.between?(1, 9)
    player2_turn = false if cell.to_i.between?(1, 9)
  end
end
puts 'its a tie'
=======
display_clear

new_game = Game.new(player1, player2)
new_game.play

# case result
# when 1
#   puts congratulations
#   puts "#{player1} won"
# when 2
#   puts congratulations
#   puts "#{player2} won"
# else
#   puts draw
# end
>>>>>>> Stashed changes
