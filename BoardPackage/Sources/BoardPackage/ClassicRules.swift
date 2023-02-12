//
//  File.swift
//  
//
//  Created by etudiant on 10/02/2023.
//

import Foundation
// CLASSE CLASSIC
public  class ClassicRules: Rules {
  public var nbreRow: Int
  public var nbreColumn: Int
    
   public init(row: Int, column: Int) {
        self.nbreRow = row
        self.nbreColumn = column
    }
    
    /// Initialise une grille de jeu vierge
    ///
    /// - Returns: Une grille de jeu avec toutes les cases initialisées à `nil`
   public func createBoard() -> [[Int?]] {
        // Créez une grille vide en utilisant la fonction `repeating`
        let grid = [[Int?]](repeating: [Int?](repeating: nil, count: nbreColumn), count: nbreRow)
        return grid
    }
    
    /// Détermine le joueur suivant
    ///
    /// - Parameter player: Le numéro du joueur actuel
    /// - Returns: Le numéro du joueur suivant
  public func getNextPlayer(player: Int) -> Int {
        // Calcule le joueur suivant en utilisant le modulo de la division de `player` par 2
        return player % 2 + 1
    }
    
    
    /// Vérifie si une case est valide pour une insertion
    ///
    /// - Parameters:
    ///   - row: La ligne de la case
    ///   - column: La colonne de la case
    ///   - grid: La grille de jeu
    /// - Returns: `true` si la case est vide, `false` sinon
public func isValid(row: Int, column: Int, grid: [[Int?]]) -> Bool {
        // Vérifiez si la valeur dans la case spécifiée est égale à `nil`
        return grid[row][column] == nil
    }
    
    /// Vérifie si une ligne, une colonne ou une diagonale a une combinaison gagnante.
    ///
    /// - Parameter grid: La grille actuelle de jeu.
    ///
    /// - Returns: `true` si une combinaison gagnante est présente, `false` sinon.
   public  func isGameOver(_ grid: [[Int?]]) -> Bool {
        // Vérifie si une ligne, une colonne ou une diagonale a une combinaison gagnante
        for row in 0..<nbreRow {
            for column in 0..<nbreColumn {
                if let value = grid[row][column] {
                    // Vérifie une combinaison gagnante horizontale
                    if column <= nbreColumn - 4 {
                        if grid[row][column + 1] == value && grid[row][column + 2] == value && grid[row][column + 3] == value {
                            return true
                        }
                    }
                    // Vérifie une combinaison gagnante verticale
                    if row <= nbreRow - 4 {
                        if grid[row + 1][column] == value && grid[row + 2][column] == value && grid[row + 3][column] == value {
                            return true
                        }
                    }
                    // Vérifie une combinaison gagnante diagonale descendante
                    if row <= nbreRow - 4 && column <= nbreColumn - 4 {
                        if grid[row + 1][column + 1] == value && grid[row + 2][column + 2] == value && grid[row + 3][column + 3] == value {
                            return true
                        }
                    }
                    // Vérifie une combinaison gagnante diagonale montante
                    if row >= 3 && column <= nbreColumn - 4 {
                        if grid[row - 1][column + 1] == value && grid[row - 2][column + 2] == value && grid[row - 3][column + 3] == value {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
    
    /// Retourne la prochaine ligne disponible dans une colonne donnée.
    ///
    /// - Parameters:
    ///   - column: La colonne pour laquelle trouver la prochaine ligne disponible.
    ///   - grid: La grille de jeu actuelle.
    ///
    /// - Returns: La ligne disponible la plus basse pour la colonne donnée, ou nil si la colonne est pleine.
  public  func getNextRow(column: Int, grid: [[Int?]]) -> Int? {
        // Parcourez les lignes de la colonne depuis le bas vers le haut.
        for row in (0..<nbreRow).reversed() {
            // Si la case est vide, renvoyez la ligne.
           
            if grid[row][column] == nil {
                return row
            }
        }
        // Si toutes les cases sont remplies, renvoyez nil.
        return nil
    }
    
    
  // Définition de la fonction "isValidMove" qui prend en entrée un entier "column" et un tableau à deux dimensions "grid"
  public func isValidMove(column: Int, grid: [[Int?]]) -> Bool {
    
    // Appel de la fonction "getNextRow" pour obtenir la prochaine ligne disponible pour la colonne donnée
    let row = getNextRow(column: column, grid: grid)
    
    // Vérification si la valeur renvoyée par "getNextRow" n'est pas nulle
    if row != nil {
      // Appel de la fonction "isValid" en lui passant la ligne obtenue, la colonne donnée et le tableau "grid"
      return isValid(row: row!, column: column, grid: grid)
    }
    
    // Si la valeur renvoyée par "getNextRow" est nulle, la fonction renvoie false
    return false
  }

}

