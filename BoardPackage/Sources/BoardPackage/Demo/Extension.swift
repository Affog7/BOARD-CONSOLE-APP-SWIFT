//
//  File.swift
//  BoardPackage
//
//  Created by etudiant on 25/01/2023.
//

import Foundation
extension Date {
    static let formatter = DateFormatter()
    
    init?(_ year : Int, _ month : Int, _ day : Int) {
        if year < 0 || month < 1 || month > 12 || day < 1 || day > 31 {
            return nil
        }
        
        Date.formatter.dateFormat = "yyy-MM-dd"
        if let temp = Date.formatter.date(from: String(year)+"-"+String(month)+"-"+String(day)){
            self = temp
            return
        }
        
        return nil
    }
    
   
   
    }
    
    
  
