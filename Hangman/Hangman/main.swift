//
//  main.swift
//  Hangman
//
//  Created by Casandra Grullon on 10/10/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

print("Let's Play Hangman!")
//computer
let allTheWords =  ["chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold"]
var alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
var wordComputerPicked: [Character] = Array(allTheWords.randomElement() ?? "hangman")
var dashes: [Character] = Array(repeatElement("_", count: wordComputerPicked.count))

//player
var letterPlayed = ""
var maxNumberofWrongGuesses = 6
var numberOfGuesses = 0

//hangman
var hangmanStart = """
..--------------------------:
.==========================:
|||                     |8|
|||                     |8|
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||55555555555555555555555555555555555555\
|||======================================|
"""
var hangmanHead = """
..--------------------------:
.==========================:
|||                     |8|
|||                     |8|
|||                     .----.
|||                    0 x >x|
|||                     |  ^ /
|||                    88888888
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||
|||======================================|
"""
var hangmanBody =
"""
-----------------------------
=============================
|||                     |8|
|||                     |8|
|||                     .----.
|||                    0 x >x|
|||                     |  ^ /
|||                    88888888
|||                   /........\
|||                    |      :
|||                    |      :
|||                    |      :
|||                     ~~~~~~:
|||
|||
|||
|||
|||
|||
|||
|||
|||======================================|
"""
var hangmanArm1 =
"""
-----------------------------
=============================
|||                     |8|
|||                     |8|
|||                     .----.
|||                    0 x >x|
|||                     |  ^ /
|||                    88888888
|||                   /........\
|||                  | |      :
|||                  | |      :
|||                  | |      :
|||                  ...~~~~~~:
|||                  | |
|||
|||
|||
|||
|||
|||
|||
|||======================================|
"""
var hangmanArm2 =
"""
-----------------------------
=============================
|||                     |8|
|||                     |8|
|||                     .----.
|||                    0 x >x|
|||                     |  ^ /
|||                    88888888
|||                   /........\
|||                  | |      : |
|||                  | |      : |
|||                  | |      : |
|||                  ...~~~~~~:..
|||                  | |      | |
|||
|||
|||
|||
|||
|||
|||
|||======================================|
"""
var hangmanLeg1 =
"""
-----------------------------
=============================
|||                     |8|
|||                     |8|
|||                     .----.
|||                    0 x >x|
|||                     |  ^ /
|||                    88888888
|||                   /........\
|||                  | |      : |
|||                  | |      : |
|||                  | |      : |
|||                  ...~~~~~~:..
|||                  | |333333| |
|||                     333
|||                     333
|||                     333
|||                     ---
|||                     ====
|||
|||
|||======================================|
"""

var hangmanGameOver =
"""
-----------------------------
=============================
|||                     |8|
|||                     |8|
|||                     .----.
|||                    0 x >x|
|||                     |  ^ /
|||                    88888888
|||                   /........\
|||                  | |      : |
|||                  | |      : |
|||                  | |      : |
|||                  ...~~~~~~:..
|||                  | |333333| |
|||                     333.33
|||                     333.33
|||                     333.33
|||                     ---.--
|||                     ====.===
|||
|||
|||======================================|
"""

var condition = true

//Gameplay
print()
print(String(dashes))

var count = 0

var usedLetters: Set<Character> = [] //

gamestartLoop: repeat {
    var indicies: Set<Int> = []
    print()
    print("Type a letter")
    print("List of used letters : \(String(usedLetters))")
    print("You guessed \(count) times")
    let response = readLine() ?? "a"
    
    if response.count != 1 { // inputing more than one letter at a time
        print("You can only try 1 letter at a time!")
        print("Please try again")
        continue gamestartLoop
    }
    let playerLetterGuess = Character(response) // new readLine
    
    if usedLetters.contains(playerLetterGuess) { // using same letter twice
        print("You've already entered this letter")
        print()
        continue gamestartLoop
    }
    
    if playerLetterGuess.isNumber { // Error: when player puts a number
        print("Hey... this is Hangman... not math")
        print("Try a letter")
        count += 1
        continue gamestartLoop
    }
    if playerLetterGuess.isNumber {
            print("Hey... this is Hangman... not math")
            print("Try a letter")
            count += 1
            continue gamestartLoop
    }
    if playerLetterGuess.isPunctuation {
            print("Hey... this is Hangman...")
            print("Try a letter")
            count += 1
            continue gamestartLoop
    }
    usedLetters.insert(playerLetterGuess)
    // verify character hasn't been used before
    if wordComputerPicked.contains(playerLetterGuess) {
        print("You're right!")
        count += 1//finds if the character is correct
        for (index , char) in wordComputerPicked.enumerated() {
            if char == playerLetterGuess {
                indicies.insert(index)
            }
        }// for loop to update dashes array with correct characters
        for (index, _) in dashes.enumerated() {
            if indicies.contains(index) {
                dashes[index] = playerLetterGuess
            }
        }
        print(String(dashes))
        
    }else {
        maxNumberofWrongGuesses -= 1
    }
    if maxNumberofWrongGuesses == 5 {
        print("Oooh... sorry. Try again")
        print()
        count += 1
        print(hangmanHead)
    }
    if dashes == wordComputerPicked {
       print("Congratulations!")
        print("You won!")
        // TO DO: let player start game again
        // restart game
       }
           var playAgain = readLine()
           print("Would you like to play another game? Yes or no?")
           if dashes == wordComputerPicked {
               restart : switch playAgain {
               case "yes" :
                continue gamestartLoop
               case "no" :
                   break
               default :
                   print("type yes to play a new game, or no to exit.")
                   playAgain = readLine()
               }
        } else if maxNumberofWrongGuesses == 4 {
        print("Oooh... sorry. Try again")
        print()
        count += 1
        print(hangmanBody)
    } else if maxNumberofWrongGuesses == 3 {
        print("Oooh... sorry. Try again")
        print()
        count += 1
        print(hangmanArm1)
    } else if maxNumberofWrongGuesses == 2 {
        print("Oooh... sorry. Try again")
        print()
        count += 1
        print(hangmanArm2)
    } else if maxNumberofWrongGuesses == 1 {
        print("You have one more chance left!")
        print()
        count += 1
        print(hangmanLeg1)
    } else if maxNumberofWrongGuesses == 0 {
        print("HANG MAN! Game Over!")
        print("The word was \(wordComputerPicked)")
        print()
        print(hangmanGameOver)
        // restart game
    }
    if maxNumberofWrongGuesses == 0 {
        _ = readLine()
        print("Would you like to play another game? Yes or no?")
        restart : switch playAgain {
        case "yes" :
            continue gamestartLoop
        case "no" :
            break
        default :
            print("type yes to play a new game, or no to exit.")
            playAgain = readLine()
        }
        }
} while condition
