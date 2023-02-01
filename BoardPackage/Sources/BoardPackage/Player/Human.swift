//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
class Human : Player {
    private var name : String
    
    init(name : String) {
         self.name = name
        super.init(type: TypePlayer.HUMAN)
    }
    
    public convenience init(){
        self.init(name : "PLAYER_D")
    }
    
    public func  putPiece()-> Int?{
        Inputer.inputNumber()
    }
    
    
    
    
}
