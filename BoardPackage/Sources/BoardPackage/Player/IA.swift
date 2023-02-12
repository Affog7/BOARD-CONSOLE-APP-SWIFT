//
//  File.swift
//  
//
//  Created by etudiant on 31/01/2023.
//

import Foundation
public class IA : Player {
    
    
  public  init(id : Int) {
        super.init( id: id,type: TypePlayer.IA)
    }
    
    
    //
    public func  putPiece()-> Int?{
        Inputer.inputNumberIA(lowerBound: 1, upperBound: 10)
    }
    
    
    public func  putPiece(_ min: Int, _ max: Int)-> Int?{
        Inputer.inputNumberIA(lowerBound: min, upperBound: max)
    }
    
    
    
}
