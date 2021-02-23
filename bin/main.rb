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
display_clear

new_game = Game.new(player1, player2)
new_game.play
