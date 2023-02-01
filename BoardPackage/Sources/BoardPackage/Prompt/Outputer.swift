//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
class Outputer{
    
    // Demande à l'utilisateur d'entrer une valeur pour une pièce
    static func printNumber(){
        print("Entrez une valeur(id) entier : \n")
    }
    
    // Demander à choisir une colonne
    static func printChooseCulomn(){
        print("Choisissez une colonne \n")
    }
    
    
    // Demander à choisir une ligne
    static func printChooseRow(){
        print("Choisissez une ligne \n")
    }
    
    
    // affiche les colonne et ligne alignées
    static func printResult(tabResult : [[Int?]]) {
        let rowCount = tabResult.count
        let columnCount = tabResult[0].count
        
        for row in 0..<rowCount {
            for column in 0..<columnCount {
                if let value = tabResult[row][column] {
                    if let previousRowValue = tabResult[row - 1][column], previousRowValue == value,
                        let previousColumnValue = tabResult[row][column - 1], previousColumnValue == value {
                        print("Row: \(row), Column: \(column), Value: \(value)")
                    }
                }
            }
        }
    }

    
    
    
    
}
