//
//  main.swift
//  BoardConsole
//
//  Created by etudiant on 07/02/2023.
//

import Foundation
import BoardPackage 

/*var bd = Board(withGrid: [[nil,nil,nil],[nil,nil,nil],[nil,nil,nil]])

let player_1 =  Human(name: "arafat", id: 12)

let player_2 =  Human(name: "najlae", id: 17)

let player_ =  Human(name: "Ali", id: 9)

let victor = Human(name: "Vic", id: 1)
let game = Game(board: bd! , players: [player_1,player_2])*/

/// Affichage ce menu
let choix = Outputer.printFirst()

//Jouer contre l'IA
if choix == 1 {
    let name = Outputer.printNom()
    let board = Board(col: Outputer.printNbColumn(), row: Outputer.printNbLigne())
    
    let game = Game(board: board! , players: [Human(name: name, id: 1),IA(id: 2)])
    
    game.play()
}

///Jouer en équipe
if choix == 2 {
    
    //ajout des joueurs
    let n = Outputer.printNbPlayers()
    var players : [Player] = []
    
    for i in 0..<n {
        players.append(Human(name: Outputer.printNom(), id: i+2))
    }
    
   
    let board = Board(col: Outputer.printNbColumn(), row: Outputer.printNbLigne())
    
    let game = Game(board: board! , players: players)
    
    game.play()
}


 

//IA contre IA
if choix == 3 {
 
    let board = Board(col: Outputer.printNbColumn(), row: Outputer.printNbLigne())
    
    let game = Game(board: board! , players: [IA(id: 1),IA(id: 2)])
    
    game.play()
}
 
