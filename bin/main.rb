#!/usr/bin/env ruby
require_relative '../lib/game'
require_relative '../lib/board'
require 'colorize'

# print messages

def display_clear
  system('clear') || system('cls')
end

def intro
  '
 █████     ███               █████                           █████
 ░░███     ░░░               ░░███                           ░░███
 ███████   ████   ██████     ███████    ██████    ██████     ███████    ██████   ██████
░░░███░   ░░███  ███░░███   ░░░███░    ░░░░░███  ███░░███   ░░░███░    ███░░███ ███░░███
  ░███     ░███ ░███ ░░░      ░███      ███████ ░███ ░░░      ░███    ░███ ░███░███████
  ░███ ███ ░███ ░███  ███     ░███ ███ ███░░███ ░███  ███     ░███ ███░███ ░███░███░░░
  ░░█████  █████░░██████      ░░█████ ░░████████░░██████      ░░█████ ░░██████ ░░██████
  ░░░░░  ░░░░░  ░░░░░░        ░░░░░   ░░░░░░░░  ░░░░░░        ░░░░░   ░░░░░░   ░░░░░░



                                 Press enter to start'
end

def display_rules
  "
████████╗██╗  ██╗███████╗    ██████╗ ██╗   ██╗██╗     ███████╗███████╗
╚══██╔══╝██║  ██║██╔════╝    ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
   ██║   ███████║█████╗      ██████╔╝██║   ██║██║     █████╗  ███████╗
   ██║   ██╔══██║██╔══╝      ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
   ██║   ██║  ██║███████╗    ██║  ██║╚██████╔╝███████╗███████╗███████║
   ╚═╝   ╚═╝  ╚═╝╚══════╝    ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝
\n\n-Players will take turns putting their mark in the empty spaces.
-Empty spaces are identified by numbers from 1-9.
-Type the number of the cell where you want to write your mark.
-In order to win the game, a player must place three of their marks in a row, horizontal, vertical, or diagonal.


                          Press enter to continue"
end

def display_name1_prompt
  'What is player 1 name?'
end

def display_name2_prompt
  'What is player 2 name? (must be different from player 1)'
end

def display_symbol_banner
  '
        Player 1            Player 2
          █████╗             ██╗  ██╗
        ██╔═══██╗            ╚██╗██╔╝
        ██║   ██║             ╚███╔╝
        ██║   ██║             ██╔██╗
        ╚██████╔╝            ██╔╝ ██╗
         ╚═════╝             ╚═╝  ╚═╝
'
end

def display_turn_prompt(player)
  "      #{player} pick a cell".green
end

def invalid_move_warning
  'Please try a valid position'
end

def display_you_chose(number)
  "You chose #{number}"
end

def display_congratulations
  "
   █████ █████    ███████    █████  █████    █████   ███   █████ █████ ██████   █████ ███ ███ ███
  ░░███ ░░███   ███░░░░░███ ░░███  ░░███    ░░███   ░███  ░░███ ░░███ ░░██████ ░░███ ░███░███░███
   ░░███ ███   ███     ░░███ ░███   ░███     ░███   ░███   ░███  ░███  ░███░███ ░███ ░███░███░███
    ░░█████   ░███      ░███ ░███   ░███     ░███   ░███   ░███  ░███  ░███░░███░███ ░███░███░███
     ░░███    ░███      ░███ ░███   ░███     ░░███  █████  ███   ░███  ░███ ░░██████ ░███░███░███
      ░███    ░░███     ███  ░███   ░███      ░░░█████░█████░    ░███  ░███  ░░█████ ░░░ ░░░ ░░░
      █████    ░░░███████░   ░░████████         ░░███ ░░███      █████ █████  ░░█████ ███ ███ ███
     ░░░░░       ░░░░░░░      ░░░░░░░░           ░░░   ░░░      ░░░░░ ░░░░░    ░░░░░ ░░░ ░░░ ░░░
\n\n".green
end

def winner(player)
  "                                           winner is #{player}".green
end

def display_draw
  "
   █████ ███████████  █████████       █████████      ██████████   ███████████     █████████   █████   ███   █████ ███
  ░░███ ░█░░░███░░░█ ███░░░░░███     ███░░░░░███    ░░███░░░░███ ░░███░░░░░███   ███░░░░░███ ░░███   ░███  ░░███ ░███
   ░███ ░   ░███  ░ ░███    ░░░     ░███    ░███     ░███   ░░███ ░███    ░███  ░███    ░███  ░███   ░███   ░███ ░███
   ░███     ░███    ░░█████████     ░███████████     ░███    ░███ ░██████████   ░███████████  ░███   ░███   ░███ ░███
   ░███     ░███     ░░░░░░░░███    ░███░░░░░███     ░███    ░███ ░███░░░░░███  ░███░░░░░███  ░░███  █████  ███  ░███
   ░███     ░███     ███    ░███    ░███    ░███     ░███    ███  ░███    ░███  ░███    ░███   ░░░█████░█████░   ░░░
   █████    █████   ░░█████████     █████   █████    ██████████   █████   █████ █████   █████    ░░███ ░░███      ███
  ░░░░░    ░░░░░     ░░░░░░░░░     ░░░░░   ░░░░░    ░░░░░░░░░░   ░░░░░   ░░░░░ ░░░░░   ░░░░░      ░░░   ░░░      ░░░
".yellow
end

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
