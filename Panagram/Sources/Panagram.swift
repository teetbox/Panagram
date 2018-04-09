//
//  Panagram.swift
//  Panagram
//
//  Created by Matt Tian on 09/04/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import Foundation

enum OptionType: String {
    case palindrome = "p"
    case anagram = "a"
    case help = "h"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "a": self = .anagram
        case "p": self = .palindrome
        case "h": self = .help
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

class Panagram {
    
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        
        let index = argument.index(argument.startIndex, offsetBy: 1)
        
        let (option, value) = getOption(String(argument.suffix(from: index)))
        
        switch option {
        case .anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else {
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]
                
                if first.isAnagramOf(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writeMessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writeMessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                consoleIO.printUsage()
            } else {
                let str = CommandLine.arguments[2]
                let isPalindrome = str.isPalindrom()
                consoleIO.writeMessage("\(str) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        case .help:
            consoleIO.printUsage()
        case .quit, .unknown:
            consoleIO.writeMessage("Unknown option \(value)")
            consoleIO.printUsage()
        }
    }
    
    func getOption(_ option: String) -> (option: OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Panagram. This program checks if an input string is an anagram or palindrome.")
        
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.writeMessage("Type 'a' to check for aragrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .anagram:
                consoleIO.writeMessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writeMessage("Type the second string:")
                let second = consoleIO.getInput()
                
                if first.isAnagramOf(second) {
                    consoleIO.writeMessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writeMessage("\(second) is not an anagram of \(first)")
                }
            case .palindrome:
                consoleIO.writeMessage("Type a word or sentence:")
                let str = consoleIO.getInput()
                let isPalindrome = str.isPalindrom()
                consoleIO.writeMessage("\(str) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
    
}
