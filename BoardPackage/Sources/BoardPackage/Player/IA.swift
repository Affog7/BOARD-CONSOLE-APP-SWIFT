//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
class IA : Player {
    
    
      init() {
        super.init(type: TypePlayer.IA)
    }
    
    
    //
    public func  putPiece()-> Int?{
        Inputer.inputNumberIA(lowerBound: 1, upperBound: 10)
    }
    
    
    public func  putPiece(_ min: Int, _ max: Int)-> Int?{
        Inputer.inputNumberIA(lowerBound: min, upperBound: max)
    }
    
    
    
}
