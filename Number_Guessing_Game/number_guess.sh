#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"
echo -e "\n~~ Number Guesser ~~"

echo -e "\nEnter your username:"
read USERNAME
USERNAME=${USERNAME:0:22}

USER=$($PSQL "SELECT user_id, name, games_played, best_game FROM users WHERE name = '$USERNAME'")

if [[ -z $USER ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name, games_played) VALUES('$USERNAME', 0);")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$USERNAME';")
  GAMES_PLAYED=0
  BEST_GAME=0
else
  IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME <<< "$USER";
  # Default to 0 if null
  GAMES_PLAYED=${GAMES_PLAYED:-0}
  BEST_GAME=${BEST_GAME:-0}

  # Change to singular if needed
  GAMES=$([ $GAMES_PLAYED == 1 ] && echo "game" || echo "games")
  GUESSES=$([ $BEST_GAME == 1 ] && echo "guess" || echo "guesses")
  
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED $GAMES, and your best game took $BEST_GAME $GUESSES."
fi

NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=0

echo -e "\nGuess the secret number between 1 and 1000:"

while true
do
  read GUESS

  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if [[ $GUESS -lt $NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  elif [[ $GUESS -gt $NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  else
    TRY=$([[ $NUMBER_OF_GUESSES == 1 ]] && echo "try" || echo "tries")

    echo -e "You guessed it in $NUMBER_OF_GUESSES $TRY. The secret number was $NUMBER. Nice job!"

    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(user_id, guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")

    if [[ $BEST -eq 0 || $NUMBER_OF_GUESSES -lt $BEST ]]
    then
      UPDATE_BEST=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE user_id = $USER_ID;")
    fi

    UPDATE_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE user_id = $USER_ID;")

    break
  fi
done