//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
public class Human : Player {
    private var name : String
    
    public init(name : String, id : Int) {
         self.name = name
        super.init(id: id, type: TypePlayer.HUMAN)
    }
    
    public convenience init( id : Int){
        self.init(name : "PLAYER_D", id: id)
    }
    
    
    //
    public func  putPiece()-> Int?{
        Inputer.inputNumber()
    }
    
    
    public func getName() -> String{
        return self.name;
    }
    
    
    
}
