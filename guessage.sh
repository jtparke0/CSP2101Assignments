#!/bin/bash

#Begin a while loop to prompt user for input to play or quit
while true; do

    #Prompt the user for input of a 1 or 2 and store result as 'selection' variable
    read -p 'Welcome to the age guesser! Enter 1 to play, or 2 to quit: ' selection

    #If the selection variable is equal to 1, proceed with guessing age code
    if [ $selection = 1 ]; then


        #Informs the user that a random age is being generated
        echo 'Random age is being generated...'

        #Generates a random integer between 20 and 70 inclusive
        #Uses modulo (%) to incorporate boundaries
        #(70 - 20 +1) + 20, where it is arranged as (upper boundary - lower boundary + 1) + lower boundary
        #Stores random integer in the 'age' variable
        age=$((RANDOM % (70 - 20 +1) + 20))
        


        #Informs the user that the random integer has been generated
        echo 'Random age is generated.'

        #Begin a while loop to continue to prompt a guess from the user until correct age is guessed
        while true; do

            #Prompt for input from user for a guess of the age
            #Store response in the 'guess' variable
            read -p 'Enter a guess of the age: ' guess

            #If the entered guess from the user IS a valid integer, continue testing
            #[0-9] where entered value must be an integer
            #Reference: Author: jimmij, URL: unix.stackexchange.com/questions/151654/checking-if-input-number-is-an-integer
            if [[ "$guess" =~ ^[0-9]+$ ]]; then

                #If the entered guess is equal to the generated age, inform the user it is correct
                #Break from the while loop
                if [ "$guess" = "$age" ]; then
                    echo 'Correct! The age was' $age
                    break

                #If the entered guess is not equal to the generated age
                else
                    #If the entered guess is lower than the generated age, inform the user that the
                    #generated age is higher than the guess
                    if [ "$guess" -lt "$age" ]; then
                        echo 'The age is higher than your guess!'

                    #If the entered guess is not lower than the generated age, inform the user that
                    #the generated age is lower than the guess
                    else
                        echo 'The age is lower than your guess!'
            
                    fi

                fi

            #If the entered guess is not an integer value, inform the user
            else
                echo "This is not an integer"

            fi

        #End the while loop
        done

    #if the selection variable is equal to 2, then thank the player for playing and exit program
    elif [ $selection = 2 ]; then
        echo "Thanks for playing!"
        exit 0
    
    #If the selection variable is not equal to 1 or 2, inform the user that the input is invalid,
    #and to try again. 
    else
        echo "Invalid input"
        #Begin the while loop again
        continue

    fi


done

