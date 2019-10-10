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
var wordComputerPicked = allTheWords.randomElement() ?? "hangman"
var wordComputerPickedArr = Array(wordComputerPicked)
var dashes = String(repeatElement("_", count: wordComputerPickedArr.count))

print(wordComputerPicked)
//player
var letterPlayed = ""
var usedLetters = String()
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
print("Type a letter")
print()
print(dashes)

repeat {
var playerLetterGuess = readLine() ?? "a"
    if wordComputerPickedArr.contains(Character(playerLetterGuess)) {
        print("right")//append into dashes
        for (index , char) in wordComputerPickedArr.enumerated() {
            if String(char) == playerLetterGuess {
            var dashesArr = Array(dashes)
            dashesArr[index] = Character(playerLetterGuess)
            }
        }
        
        
        
        
        
        
        
    } else {
        print("Wrong")
        maxNumberofWrongGuesses -= 1
    }
    if maxNumberofWrongGuesses == 5 {
        print(hangmanHead)
    } else if maxNumberofWrongGuesses == 4 {
        print(hangmanBody)
    } else if maxNumberofWrongGuesses == 3 {
        print(hangmanArm1)
    } else if maxNumberofWrongGuesses == 2 {
        print(hangmanArm2)
    } else if maxNumberofWrongGuesses == 1 {
        print(hangmanLeg1)
    } else if maxNumberofWrongGuesses == 0 {
        print("HANG MAN! Game Over!")
        print(hangmanGameOver)
//    } else {
//        print("I don't know what you're doing wrong...")
    }

} while condition
