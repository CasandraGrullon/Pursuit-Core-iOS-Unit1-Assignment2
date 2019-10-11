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
let allTheWords = ["able", "about", "account", "acid", "across", "addition", "adjustment", "advertisement", "after", "again", "against", "agreement", "almost", "among", "amount", "amusement", "angle", "angry", "animal", "answer", "apparatus", "apple", "approval", "arch", "argument", "army", "attack", "attempt", "attention", "attraction", "authority", "automatic", "awake", "baby", "back", "balance", "ball", "band", "base", "basin", "basket", "bath", "beautiful", "because", "before", "behaviour", "belief", "bell", "bent", "berry", "between", "bird", "birth", "bite", "bitter", "black", "blade", "blood", "blow", "blue", "board", "boat", "body", "boiling", "bone", "book", "boot", "bottle", "brain", "brake", "branch", "brass", "bread", "breath", "brick", "bridge", "bright", "broken", "brother", "brown", "brush", "bucket", "building", "bulb", "burn", "burst", "business", "butter", "button", "cake", "camera", "canvas", "card", "care", "carriage", "cart", "cause", "certain", "chain", "chalk", "chance", "change", "cheap", "cheese", "chemical", "chest", "chief", "chin", "church", "circle", "clean", "clear", "clock", "cloth", "cloud", "coal", "coat", "cold", "collar", "colour", "comb", "come", "comfort", "committee", "common", "company", "comparison", "competition", "complete", "complex", "condition", "connection", "conscious", "control", "cook", "copper", "copy", "cord", "cork", "cotton", "cough", "country", "cover", "crack", "credit", "crime", "cruel", "crush", "current", "curtain", "curve", "cushion", "damage", "danger", "dark", "daughter", "dead", "dear", "death", "debt", "decision", "deep", "degree", "delicate", "dependent", "design", "desire", "destruction", "detail", "development", "different", "digestion", "direction", "dirty", "discovery", "discussion", "disease", "disgust", "distance", "distribution", "division", "door", "doubt", "down", "drain", "drawer", "dress", "drink", "driving", "drop", "dust", "early", "earth", "east", "edge", "education", "effect", "elastic", "electric", "engine", "enough", "equal", "error", "even", "event", "ever", "every", "example", "exchange", "existence", "expansion", "experience", "expert", "face", "fact", "fall", "false", "family", "farm", "father", "fear", "feather", "feeble", "feeling", "female", "fertile", "fiction", "field", "fight", "finger", "fire", "first", "fish", "fixed", "flag", "flame", "flat", "flight", "floor", "flower", "fold", "food", "foolish", "foot", "force", "fork", "form", "forward", "fowl", "frame", "free", "frequent", "friend", "from", "front", "fruit", "full", "future", "garden", "general", "girl", "give", "glass", "glove", "goat", "gold", "good", "government", "grain", "grass", "great", "green", "grey", "grip", "group", "growth", "guide", "hair", "hammer", "hand", "hanging", "happy", "harbour", "hard", "harmony", "hate", "have", "head", "healthy", "hear", "hearing", "heart", "heat", "help", "high", "history", "hole", "hollow", "hook", "hope", "horn", "horse", "hospital", "hour", "house", "humour", "idea", "important", "impulse", "increase", "industry", "insect", "instrument", "insurance", "interest", "invention", "iron", "island", "jelly", "jewel", "join", "journey", "judge", "jump", "keep", "kettle", "kick", "kind", "kiss", "knee", "knife", "knot", "knowledge", "land", "language", "last", "late", "laugh", "lead", "leaf", "learning", "leather", "left", "letter", "level", "library", "lift", "light", "like", "limit", "line", "linen", "liquid", "list", "little", "living", "lock", "long", "look", "loose", "loss", "loud", "love", "machine", "make", "male", "manager", "mark", "market", "married", "mass", "match", "material", "meal", "measure", "meat", "medical", "meeting", "memory", "metal", "middle", "military", "milk", "mind", "mine", "minute", "mist", "mixed", "money", "monkey", "month", "moon", "morning", "mother", "motion", "mountain", "mouth", "move", "much", "muscle", "music", "nail", "name", "narrow", "nation", "natural", "near", "necessary", "neck", "need", "needle", "nerve", "news", "night", "noise", "normal", "north", "nose", "note", "number", "observation", "offer", "office", "only", "open", "operation", "opinion", "opposite", "orange", "order", "organization", "ornament", "other", "oven", "over", "owner", "page", "pain", "paint", "paper", "parallel", "parcel", "part", "past", "paste", "payment", "peace", "pencil", "person", "physical", "picture", "pipe", "place", "plane", "plant", "plate", "play", "please", "pleasure", "plough", "pocket", "point", "poison", "polish", "political", "poor", "porter", "position", "possible", "potato", "powder", "power", "present", "price", "print", "prison", "private", "probable", "process", "produce", "profit", "property", "prose", "protest", "public", "pull", "pump", "punishment", "purpose", "push", "quality", "question", "quick", "quiet", "quite", "rail", "rain", "range", "rate", "reaction", "reading", "ready", "reason", "receipt", "record", "regret", "regular", "relation", "religion", "representative", "request", "respect", "responsible", "rest", "reward", "rhythm", "rice", "right", "ring", "river", "road", "roll", "roof", "room", "root", "rough", "round", "rule", "safe", "sail", "salt", "same", "sand", "scale", "school", "science", "scissors", "screw", "seat", "second", "secret", "secretary", "seed", "seem", "selection", "self", "send", "sense", "separate", "serious", "servant", "shade", "shake", "shame", "sharp", "sheep", "shelf", "ship", "shirt", "shock", "shoe", "short", "shut", "side", "sign", "silk", "silver", "simple", "sister", "size", "skin", "skirt", "sleep", "slip", "slope", "slow", "small", "smash", "smell", "smile", "smoke", "smooth", "snake", "sneeze", "snow", "soap", "society", "sock", "soft", "solid", "some", "song", "sort", "sound", "soup", "south", "space", "spade", "special", "sponge", "spoon", "spring", "square", "stage", "stamp", "star", "start", "statement", "station", "steam", "steel", "stem", "step", "stick", "sticky", "stiff", "still", "stitch", "stocking", "stomach", "stone", "stop", "store", "story", "straight", "strange", "street", "stretch", "strong", "structure", "substance", "such", "sudden", "sugar", "suggestion", "summer", "support", "surprise", "sweet", "swim", "system", "table", "tail", "take", "talk", "tall", "taste", "teaching", "tendency", "test", "than", "that", "then", "theory", "there", "thick", "thin", "thing", "this", "thought", "thread", "throat", "through", "through", "thumb", "thunder", "ticket", "tight", "till", "time", "tired", "together", "tomorrow", "tongue", "tooth", "touch", "town", "trade", "train", "transport", "tray", "tree", "trick", "trouble", "trousers", "true", "turn", "twist", "umbrella", "under", "unit", "value", "verse", "very", "vessel", "view", "violent", "voice", "waiting", "walk", "wall", "warm", "wash", "waste", "watch", "water", "wave", "weather", "week", "weight", "well", "west", "wheel", "when", "where", "while", "whip", "whistle", "white", "wide", "will", "wind", "window", "wine", "wing", "winter", "wire", "wise", "with", "woman", "wood", "wool", "word", "work", "worm", "wound", "writing", "wrong", "year", "yellow", "yesterday", "young"]

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
|||                   /.......:|
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
|||                  /........:
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
|||                   /.......: |
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
|||                  /....... : |
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
|||                   /....... :|
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
func gameReStart(){
    letterPlayed = ""
    maxNumberofWrongGuesses = 6
    numberOfGuesses = 0
    count = 0
    wordComputerPicked = Array(allTheWords.randomElement() ?? "hangman")
    dashes = Array(repeatElement("_", count: wordComputerPicked.count))
    usedLetters = []
    print()
    print(String(dashes))
}

func gameStart() {
gamestartLoop : repeat {
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
        print()
        print("It took you \(count) guesses to win")
        print()
        print("Would you like to start a new game? Yes or No?")
        let playerRestart = readLine()
    switch true {
    case playerRestart == "yes" :
        gameReStart()
    default :
        print("Thanks for playing!")
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
        print("The word was \(String(wordComputerPicked))")
        print()
        print(hangmanGameOver)
        // restart game
    }
    if maxNumberofWrongGuesses == 0 {
        _ = readLine()
        print("Would you like to play another game? Yes or no?")
        let playerRestart = readLine()
        switch true {
        case playerRestart == "yes" :
            gameReStart()
        default :
            print("Thanks for playing!")
        }
        }
} while condition
}

gameStart()

