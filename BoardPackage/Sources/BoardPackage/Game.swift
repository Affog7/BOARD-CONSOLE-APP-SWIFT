//
//  File.swift
//  
//
//  Created by etudiant on 27/01/2023.
//

import Foundation
public class Game : Rules {
    
    var nbreRow: Int = 10
    var nbreColumn: Int = 10
    var board : Board
    var players : [Player]
    
    // p
    func isGameOver() -> Bool {
        
        return false
    }
    
    
     init(board: Board, players: [Player]) {
        self.board = board
        self.players = players
    }
    
    
    
    
    
    
}
