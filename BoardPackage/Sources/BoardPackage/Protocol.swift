//
//  File.swift
//  
//
//  Created by etudiant on 25/01/2023.
//

import Foundation
protocol Noisable {
    var noisy : Int { get }
    func shout() -> String
    mutating func eat()
    static func prouf()
}

protocol Toggable {
    mutating func toggle()
}
