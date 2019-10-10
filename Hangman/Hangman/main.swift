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

print(wordComputerPicked)
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

startloop: repeat {
    var indicies: Set<Int> = []
    
    print("Letters entered: \(String(usedLetters))")
    print("Type a letter")
    let response = readLine() ?? "a"
    
    if response.count != 1 {
        print("Only 1 character allowed, please enter again")
        continue startloop
    }
    
    
    let playerLetterGuess = Character(response)
    
    if usedLetters.contains(playerLetterGuess) {
        print("You already entered this letter")
        continue startloop
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
                usedLetters.insert(playerLetterGuess)
            }
        }
        print(String(dashes))
//    }
//    for (index, char) in usedLetters.enumerated() {
//        if playerLetterGuess == char {
//            print("You already tried that letter")
//            count += 1
    } else if playerLetterGuess.isNumber {
        print("Hey... this is Hangman... not math")
        print("Try a letter")
        count += 1
    } else if playerLetterGuess.isPunctuation {
        print("Hey... this is Hangman...")
        print("Try a letter")
        count += 1
    }else {
        maxNumberofWrongGuesses -= 1
    }
    if maxNumberofWrongGuesses == 5 {
        print("Oooh... sorry. Try again")
        print()
        count += 1
        print(hangmanHead)
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
        print()
        print(hangmanGameOver)
        //    } else {
        //        print("I don't know what you're doing wrong...")
        
    }
    
} while condition
