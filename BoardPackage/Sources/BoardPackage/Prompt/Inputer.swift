//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
class Inputer {
    
    
    
    /// #HUMAIN
    
    // Recupere et envoie la valeur rentrée par l'utilisateur pour un humain
    static func inputNumber() -> Int?{
        Outputer.printNumber()
        return self.takeNumber()
    }

    // Recupere et envoie la valeur rentrée par l'utilisateur pour un humain avec le message : paramettre
    static func inputNumber(_ message : String) -> Int?{
        Outputer.printNumber(message)
        return self.takeNumber()
    }
    
    // Recuperer un tupple pour inserer à une position donnée (colum, valeur)
    static func inputAtPosition()->(column : Int?, val : Int?){
        Outputer.printChooseCulomn()
        let col = self.takeNumber()
       
        Outputer.printNumber()
        let val = self.takeNumber()
        
        return (col,val)
    }
    
    // Recuperer un tupple pour inserer à une position donnée (row,colum, id)
    static func rempoveAtPosition()->(row : Int?, column : Int?, val : Int?) {
       
        Outputer.printChooseRow()
        let row = self.takeNumber()
        
        Outputer.printChooseCulomn()
        let col = self.takeNumber()
        
        Outputer.printNumber()
        let val = self.takeNumber()
       
        return (row,col,val)
    }
    
    // Utils
    private static func takeNumber()->Int?{
        let input = readLine()
        if let input = input, let number = Int(input) {
            return number
        } else {
            return nil
        }
    }
    
    
    
    ///  #IA
    ///
    ///
    // Recupere et envoie la valeur rentrée par l'utilisateur IA
    static func inputNumberIA(lowerBound: Int, upperBound: Int) -> Int {
        return Int.random(in: lowerBound...upperBound)
    }
    
    
    
}
