#! /bin/bash
#
# Author: @hudsonsmtih
# Game.sh: A math game created to show off fancy bash scripting.

function main ()
{
  # Declare the score variable.
  declare -i score
  local score
  score=0

  # Declare the health variable.
  declare -i health
  local health
  health=10

  # Declare the maximum variable.
  declare -i max
  local max
  max=3

  # Declare the minimum variable.
  declare -i min
  local min
  min=1

  # Declare the names array.
  declare -a names
  local names
  
  names=(
    "Sarge"
    "Victor"
    "Delta"
    "Rocko"
    "Twilight"
    "Mr. Cruel"
  )

  qoutes=(
    "Down and give me ten."
    "Darling, I am the victor."
    "Fast, like the wind."
    "Tough, rough and buff."
    "I'll make you see the stars."
    "Welcome to hell."
  )

  # Declare the current boss integer.
  declare -i current_boss
  local current_boss
  current_boss=0 


  # Clear the screen and start the game.
  clear

  # Main game loop.
  while (( $health >= 1)); do
    echo "${names[$current_boss]}: ${qoutes[$current_boss]}"

    # Make num_1.
    declare -i num_1
    local num_1
    num_1=$(($min + RANDOM % $max))

    # Make num_2.
    declare -i num_2
    local num_2
    num_2=$(($min + RANDOM % $max))

    # Declare the equation as a string
    # So that it may be used in conditionals against
    # user input.
    local equation
    equation=$(($num_1 * $num_2))

    read -p "${num_1} * ${num_2}: " answer

    if [[ ! ${answer} ]]; then
      ((health--))
      echo -e "\n0h, y0u 1d10t, d03s th@t l00k l1k3 a numb3r??!??!"
      echo "Your health is: ${health}"
      echo "Your IQ is: -$((60 + RANDOM % 150))"
      read -p "[HIT ENTER 1d10t]"
      clear
      continue
    fi

    if (( ${answer} == ${equation} )); then
      echo -e "\nCorrect"
      ((score++))
      echo "Score is ${score}"
    else
      echo -e "\nIncorrect"
      echo "Answer was: ${equation}"
      ((health--))
      echo "Health is ${health}"
      read -p "PRESS [ENTER]"
    fi

    if (( current_boss != ((score / 5)) )); then
      ((current_boss=score / 5))
      ((min++))
      ((max++))
    fi

    clear

  done
}

main
