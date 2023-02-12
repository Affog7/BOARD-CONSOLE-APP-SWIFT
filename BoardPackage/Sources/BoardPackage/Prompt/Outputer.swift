//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
public class Outputer{
    
    // Demande à l'utilisateur d'entrer une valeur pour une pièce
    public static func printNumber(){
        print("Entrez une valeur(id) entier : \n")
    }
    
    // Affiche le message destiné à l'utilisateur
    public  static func printNumber(_ message : String){
        print("\(message) \n")
    }
     
    // Demander à choisir une colonne
    public  static func printChooseCulomn(){
        print("Choisissez une colonne \n")
    }
    
    
    // Demander à choisir une ligne
    public static func printChooseRow(){
        print("Choisissez une ligne \n")
    }
    
    
    
    // Demander à choisir
    public  static func printFirst() ->Int{
        print("Fonctionnalité \n")
        print("1 - Joueur contre l'IA \n")
        print("2- Joueur en équipe \n")
        print("3- Voir Deux IAs jouéés \n")
        var d = 0
        repeat{
            d =  Inputer.inputNumber("Votre choix")!
        }while(d > 3 || d < 1 || d == nil)
        return d;
    }
    
    // Demander à choisir nombre d'équipe
    public   static func printNbPlayers() ->Int{
        Outputer.printNumber("Entrez le nombre de joueurs")
        var d = 0
        repeat{
            d =  Inputer.inputNumber("Votre choix")!
        }while( d < 1 || d == nil)
        return d;
    }
    
    
    // Demander à choisir nombre d'équipe
    public   static func printNbColumn() ->Int{
        Outputer.printNumber("Entrez le nombre de column")
        var d = 0
        repeat{
            d =  Inputer.inputNumber("Votre choix")!
        }while( d < 1 || d == nil)
        return d;
    }
    
    
    // Demander à choisir nombre d'équipe
    public  static func printNbLigne() ->Int{
        Outputer.printNumber("Entrez le nombre de Ligne")
        var d = 0
        repeat{
            d =  Inputer.inputNumber("Votre choix")!
        }while( d < 1 || d == nil)
        return d;
    }

    
    // Demander à choisir nom
    public  static func printNom() ->String{
        Outputer.printNumber("Entrez votre nom")
        var d = ""
        repeat{
            d =  Inputer.inputName()!
        }while( d == nil)
        return d;
    }
    
    // affiche les colonne et ligne alignées
    public  static func printResult(tabResult : [[Int?]]) {
        let rowCount = tabResult.count
        let columnCount = tabResult[0].count
        var data = ""
        for row in 0..<rowCount {
            for column in 0..<columnCount {
                if let value = tabResult[row][column] {
                    if let previousRowValue = tabResult[row][column], previousRowValue == value,
                        let previousColumnValue = tabResult[row][column], previousColumnValue == value {
                        data.append("\(value.description)      ")
                        //print()
                    }
                }else{
                    data.append("X       ")}
            }
            
            data.append("\n")
        }
        print(data)
        
        
        
        
    }

    
    

    
}
