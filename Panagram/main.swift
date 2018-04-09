//
//  main.swift
//  Panagram
//
//  Created by Matt Tian on 09/04/2018.
//  Copyright © 2018 TTSY. All rights reserved.
//

import Foundation

let paragram = Panagram()

if CommandLine.argc < 2 {
    paragram.interactiveMode()
} else {
    paragram.staticMode()
}

