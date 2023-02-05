//
//  File.swift
//  
//
//  Created by etudiant on 27/01/2023.
//

import Foundation
class Player {
    // Propriété pour l'identifiant du joueur
    public var id : Int
    // Propriété pour le type de joueur (IA ou humain)
    public var type : TypePlayer
    
    // Initialiseur pour créer un joueur avec un identifiant et un type
    public init(id: Int, type: TypePlayer) {
        self.id = id
        self.type = type
    }
}

// Énumération pour représenter le type de joueur
public  enum TypePlayer : Equatable{
    case IA
    case HUMAN
}

   
