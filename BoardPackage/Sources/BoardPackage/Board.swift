//
//  File.swift
//
//
//  Created by etudiant on 17/01/2023.
//

import Foundation
public struct Board : CustomStringConvertible {
    public var description: String = ""
        
   
    public let nbreRow : Int
    public let nbreColumn : Int
    public var grid : [[Int?]]


    // Initialiser avec du grid
   public  init?(withGrid grid : [[Int?]] ) {
       
       let result =  grid.allSatisfy { $0.count == grid[0].count }
       
       guard result
       else {
          
           return nil
       }
       
       guard grid.count > 0   else {
           return nil
       }
       
       guard grid[0].count > 0   else {
           return nil
       }
       
       self.nbreRow = grid.count
       self.nbreColumn = grid[0].count
       
       self.grid = grid
   
       
    }
    
    // Initialiser avce ligne et colonnes
    public init?( col : Int, row : Int ) {
        
        self.nbreRow = row
        self.nbreColumn = col
        
        if ( col <= 0 || row <= 0 ) { return nil}
        
        // jegged Arrays
        self.grid = Array(repeating: Array(repeating: nil, count: col), count: row)
        
    }
    
    
    private mutating func insertPiece(col : Int, row : Int, id : Int)->BoardResult  {
        
        // si c'est hors limite
        if ( col < 0  || row < 0 || col >= self.nbreColumn || row >= self.nbreRow )
        {
            return .Fail(reason: FailRaison.out)
        }
        
       // si c'est plein
        if ( self.grid[row][col] != 0) {
            return .Fail(reason: FailRaison.full)
        }
        
        //
        if ( self.grid[row][col] == 0 ) {
            self.grid[row][col] = id
            return .ok
        }
        
        
        return .unknown
            
       }
  
    
    public mutating  func insertPiecce(col : Int, id : Int )->Bool {
        if(col >=  0 && col < self.nbreColumn){
            for i in 0 ... self.nbreRow-1 {
                if(self.grid[i][col] == nil){
                    self.grid[i][col] = id
                    
                    return true
                }
            }
        }
        return false
    }
    
    
    public  mutating func removePiece ( _col : Int, row : Int, id :  Int )  {
        if (_col < 0  || row < 0 || _col >= self.nbreColumn || row >= self.nbreRow ) { return }
        if self.grid[row][_col] == id {
            self.grid[row].remove(at: _col)
        }
    }

    
    public mutating func isFull() ->Bool {
        for i in 0...self.nbreRow-1 {
            for j in 0...self.nbreColumn-1 {
                if(self.grid[i][j] == nil){ return false}
            }
        }
        
        return true
    }
    
}
    

public  enum BoardResult{
    case unknown
    case ok
    case  Fail(reason : FailRaison)
}
   

public enum FailRaison{
    case out
    case full
}
