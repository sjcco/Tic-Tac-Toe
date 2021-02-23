#!/usr/bin/env ruby
require 'colorize'
def board
  cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  puts <<-HEREDOC

        #{cells[0]}  | #{cells[1]} | #{cells[2]}
        ---+---+---
        #{cells[3]}  | #{cells[4]} | #{cells[5]}
        ---+---+---
        #{cells[6]}  | #{cells[7]} | #{cells[8]}

  HEREDOC
end

puts "
 █████     ███               █████                           █████
 ░░███     ░░░               ░░███                           ░░███
 ███████   ████   ██████     ███████    ██████    ██████     ███████    ██████   ██████
░░░███░   ░░███  ███░░███   ░░░███░    ░░░░░███  ███░░███   ░░░███░    ███░░███ ███░░███
  ░███     ░███ ░███ ░░░      ░███      ███████ ░███ ░░░      ░███    ░███ ░███░███████
  ░███ ███ ░███ ░███  ███     ░███ ███ ███░░███ ░███  ███     ░███ ███░███ ░███░███░░░
  ░░█████  █████░░██████      ░░█████ ░░████████░░██████      ░░█████ ░░██████ ░░██████
  ░░░░░  ░░░░░  ░░░░░░        ░░░░░   ░░░░░░░░  ░░░░░░        ░░░░░   ░░░░░░   ░░░░░░


                                                                                       ".green
puts ''
puts '                                   Press enter to start'
gets
system('clear') || system('cls')
puts '
████████╗██╗  ██╗███████╗    ██████╗ ██╗   ██╗██╗     ███████╗███████╗
╚══██╔══╝██║  ██║██╔════╝    ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
   ██║   ███████║█████╗      ██████╔╝██║   ██║██║     █████╗  ███████╗
   ██║   ██╔══██║██╔══╝      ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
   ██║   ██║  ██║███████╗    ██║  ██║╚██████╔╝███████╗███████╗███████║
   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝
'.yellow
puts ''
puts '-Players will take turns putting their mark in the empty spaces.'
puts '-Empty spaces are identified by numbers from 1-9.'
puts '-Type the number of the cell where you want to write your mark.'
puts '-In order to win the game, a player must place three of their marks in a horizontal, vertical, or diagonal row.'
puts ''
puts 'Press enter to continue'
gets
system('clear') || system('cls')

player1 = ''
while player1.empty?
  puts 'What is player 1 name?'.blue
  player1 = gets.chomp
end
player2 = ''
while player2.empty?
  puts 'What is player 2 name? (must be different from player 1)'.red
  player2 = gets.chomp
  player2 = '' if player1 == player2
end
system('clear') || system('cls')
print '
        Player 1            Player 2
          █████╗             ██╗  ██╗
        ██╔═══██╗            ╚██╗██╔╝
        ██║   ██║             ╚███╔╝
        ██║   ██║             ██╔██╗
        ╚██████╔╝            ██╔╝ ██╗
         ╚═════╝             ╚═╝  ╚═╝
'
sleep 2
system('clear') || system('cls')
puts '                                READY'
sleep 0.7
system('clear') || system('cls')
puts '                                 SET'
sleep 0.7
system('clear') || system('cls')
puts '                                  GO'
sleep 0.7
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
  cell = 0
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
