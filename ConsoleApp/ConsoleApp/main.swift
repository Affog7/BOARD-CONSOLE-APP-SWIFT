//
//  main.swift
//  ConsoleApp
//
//  Created by etudiant on 18/01/2023.
//

import Foundation
import SwiftPackage

print("Hello, World!")

if var dfh = Board(withGrid: [[3,2],[2,nil],[2,2],[2,2]]) {
    
    print(dfh.description)
}
