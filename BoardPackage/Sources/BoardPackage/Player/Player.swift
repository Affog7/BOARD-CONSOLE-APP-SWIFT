//
//  File.swift
//  
//
//  Created by etudiant on 27/01/2023.
//

import Foundation
class Player {
   
    private var type : TypePlayer
    
    public init( type: TypePlayer) {
        self.type = type
    }
    
   
}

 
public  enum TypePlayer : Equatable{
    case IA
    case HUMAN
}
   
