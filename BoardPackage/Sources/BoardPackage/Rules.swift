//
//  File.swift
//  
//
//  Created by etudiant on 27/01/2023.
//

import Foundation
protocol Rules {
    var nbreRow : Int { get }
    var nbreColumn : Int {get} 
   mutating func isGameOver() -> Bool 
  
}
