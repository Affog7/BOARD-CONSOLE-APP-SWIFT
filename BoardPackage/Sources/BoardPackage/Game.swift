//
//  File.swift
//  
//
//  Created by etudiant on 27/01/2023.
//

import Foundation
public class Game  {
    var board: Board
    var rules: Rules
    var players: [Player]
    var currentPlayerIndex = 0
    
    
    init(board: Board, players: [Player]) {
        self.board = board
        self.rules = ClassicRules(row: board.nbreRow, column: board.nbreColumn)
        self.players = players
    }
    
    init(board: Board, rules: Rules, players: [Player]) {
        self.board = board
        self.rules = rules
        self.players = players
    }
    

    /// La méthode `play` joue le jeu de puissance 4. Elle utilise les règles `rules` et le plateau de jeu `board` ainsi que les joueurs `players`.
    /// Elle boucle tant que la partie n'est pas terminée en appelant la méthode `isGameOver` sur le plateau de jeu.
    /// Chaque tour du jeu est déterminé en déterminant le joueur actuel en utilisant l'index du joueur actuel (`currentPlayerIndex`) et en modulant ce nombre par le nombre total de joueurs `players.count`.
    /// Le joueur est informé que c'est son tour et doit choisir une colonne (s'il est un joueur humain). Si c'est un joueur IA, l'IA jouera un tour.
    /// La méthode `inputNumber` est utilisée pour obtenir la colonne choisie et la méthode `isValidMove` est appelée pour vérifier si ce choix est valide.
    /// Si le choix n'est pas valide, le joueur est informé de ce fait et doit en choisir un autre.
    /// Une fois un choix valide est effectué, la méthode `getNextRow` est appelée pour déterminer la ligne dans laquelle le pion sera déposé.
    /// Le pion est alors déposé en utilisant la position de la ligne et de la colonne choisie.
    /// La méthode `printResult` est appelée pour afficher le résultat actuel du plateau de jeu.
    /// L'index du joueur actuel est incrémenté pour passer au tour suivant.
    /// Lorsque la partie est terminée, un message "Partie terminée!" est affiché.
    func play() {
        while !rules.isGameOver(board.grid) {
            // Boucle jusqu'à ce que la partie soit terminée en utilisant la méthode isGameOver() du objet rules pour vérifier l'état du plateau de jeu.
            
            let currentPlayer = players[currentPlayerIndex % players.count]
            // Récupère le joueur actuel en utilisant l'index courant et en le modulant par le nombre de joueurs.
            
            print("C'est au tour du joueur \(currentPlayer.id)")
            // Affiche une notification pour informer le joueur actuel qu'il est son tour.
            
            var column : Int?
            repeat {
                if currentPlayer.type != TypePlayer.IA {
                    // Si le type de joueur actuel n'est pas une intelligence artificielle, demander à l'utilisateur de choisir une colonne.
                    
                    column = Inputer.inputNumber("Choisissez une colonne (0-\(board.nbreColumn-1)): ")
                } else {
                    // Sinon, c'est un joueur contrôlé par l'IA.
                    
                    Outputer.printNumber("IA\n")
                    // ....
                }
            }while !rules.isValidMove(column: column!, grid: board.grid)
            // Boucle jusqu'à ce qu'un mouvement valide soit sélectionné en utilisant la méthode isValidMove() du objet rules pour vérifier la validité du mouvement.
            
            let row = rules.getNextRow(column: column!, grid: board.grid)
            // Récupère la prochaine ligne disponible dans la colonne choisie en utilisant la méthode getNextRow() du objet rules.
            
            board.grid[row!][column!] = currentPlayer.id
            // Met à jour la grille avec le nouveau mouvement en assignant l'identifiant du joueur actuel à la case correspondante.
            
            Outputer.printResult(tabResult: board.grid)
            // Affiche le nouvel état du plateau de jeu en utilisant la méthode printResult() de l'objet Outputer.
            
            currentPlayerIndex += 1
            // Incrémente l'index courant pour passer au joueur suivant.
        }
        print("Partie terminée!")
        // Affiche une notification pour informer que la partie est terminée.
    }

}
    
    
    // CLASSE CLASSIC
    class ClassicRules: Rules {
        var nbreRow: Int
        var nbreColumn: Int
        
        init(row: Int, column: Int) {
            self.nbreRow = row
            self.nbreColumn = column
        }
        
        /// Initialise une grille de jeu vierge
        ///
        /// - Returns: Une grille de jeu avec toutes les cases initialisées à `nil`
        func createBoard() -> [[Int?]] {
            // Créez une grille vide en utilisant la fonction `repeating`
            var grid = [[Int?]](repeating: [Int?](repeating: nil, count: nbreColumn), count: nbreRow)
            return grid
        }
        
        /// Détermine le joueur suivant
        ///
        /// - Parameter player: Le numéro du joueur actuel
        /// - Returns: Le numéro du joueur suivant
        func getNextPlayer(player: Int) -> Int {
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
        func isValid(row: Int, column: Int, grid: [[Int?]]) -> Bool {
            // Vérifiez si la valeur dans la case spécifiée est égale à `nil`
            return grid[row][column] == nil
        }
        
        /// Vérifie si une ligne, une colonne ou une diagonale a une combinaison gagnante.
        ///
        /// - Parameter grid: La grille actuelle de jeu.
        ///
        /// - Returns: `true` si une combinaison gagnante est présente, `false` sinon.
        func isGameOver(_ grid: [[Int?]]) -> Bool {
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
        func getNextRow(column: Int, grid: [[Int?]]) -> Int? {
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
        
        
        
        
        func isValidMove(column: Int, grid: [[Int?]]) -> Bool {
            let row = getNextRow(column: column, grid: grid)
            return row != nil && isValid(row: row!, column: column, grid: grid)
        }
        
    }
    
