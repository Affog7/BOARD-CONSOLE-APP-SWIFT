//
//  File.swift
//  
//
//  Created by etudiant on 27/01/2023.
//

import Foundation
public protocol Rules {
    var nbreRow : Int { get }
    var nbreColumn : Int {get} 
    mutating func isGameOver(_ grid: [[Int?]]) -> Bool
    func createBoard() -> [[Int?]]
    func getNextPlayer(player: Int) -> Int
    func isValid(row: Int, column: Int, grid: [[Int?]]) -> Bool
    func isValidMove(column: Int, grid: [[Int?]]) -> Bool
    func getNextRow(column: Int, grid: [[Int?]]) -> Int? 
  //  func checkWin(board: [[Int?]]) -> Bool
}
