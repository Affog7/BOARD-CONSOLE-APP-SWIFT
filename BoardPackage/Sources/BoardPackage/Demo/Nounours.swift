//
//  File.swift
//  
//
//  Created by etudiant on 25/01/2023.
//
import Foundation

/* public struct Nounours  : Equatable{
    public var name : String
    public var nbPoils : Int
    public var naissance : Date
    
    public static func == (_ n1 : Nounours, _ n2 : Nounours)-> Bool{
        n1.name == n2.name
    }
}*/

public class Nounours  : Equatable, Noisable {
    func shout() -> String {
"fghgjvhbjlk"
    }
    
    static func prouf() {
        
    }
    
   
    func eat() {
        self.nbPoils += 12
    }
    
    ///
    ///   <<PROtocol>>
    ///   Rules
    ///   ->nbRows
    ///   -> nbreColum
    ///
    ///   nbPiecesAlign // nombre de pieces aligner pour gagner
    ///
    ///   isGameOver =< vainqueur ll qi ll casealigné
    ///
    ///
    ///
    
    public var name : String
    public var nbPoils : Int = 1
    public var noisy : Int
    public var naissance : Date
    /// Short dsk
    /// chdiqfhsvkfdd
    ///
    ///rgjhjvbklrl
    ///grtgyhsyhjj
    ///
    /// #gjggj
    /// - parameters
    ///     - n1 : Nounours ``Nounours``
    ///
    ///
    public static func == (_ n1 : Nounours, _ n2 : Nounours)-> Bool{
        n1.name == n2.name
    }
    
   
    init(name: String, nbPoils: Int,  naissance: Date) {
        self.name = name
        self.nbPoils = nbPoils
        self.noisy = 1
        self.naissance = naissance
    }
}


let n1 = Nounours(name: "Come", nbPoils: 244, naissance: Date(2000,09,12)!)
let n2 = Nounours(name: "Come", nbPoils: 254,  naissance: Date(2006,09,12)!)
 
/*
public func hash(into hasher : inout)-> String {
    
}
*/


public enum Toggle : Toggable{
    
    case on
    case off

    mutating func toggle() {
        switch self{
            
        case .on :
            self = .off
        case .off :
            self = .on
        }
   
    }
    
  
}

extension Array : Toggable where Element : Toggable {
    mutating func toggle() {
        for i in 0..<self.count {
            self[i].toggle()
        }
    }
    
    
}

public class Animal {
    
    public let name : String
    
    // DESIGNATED INIATIALASER
    public init(name: String) {
        self.name = name
    }
    
    // CONVENIENCE INITIALIZER
    convenience init(_ nom : String){ // PEUT APPELER TOUT TYPE
        self .init(name : "hjbjnk:")
    }
    
    
    
    // DESIGNATED INITIALISER
    public convenience init(){
        self.init("tchgjvkbkn") // DETAGATION D'INITIALISATION
    }
    // canbeoverride
    public func shout() -> String{
        "str"
    }
    
    
    
    
    // non overriblable
    public final func nnn() -> String {
        "incoruptible"
    }
}

public class Cat : Animal{
    public  init() {
        super.init(name : "fghcv")
    }
    override public func shout() -> String {
        "fille"
    }
}

