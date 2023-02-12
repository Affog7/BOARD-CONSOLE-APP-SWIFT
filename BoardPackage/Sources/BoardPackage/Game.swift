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
    
    
   public init(board: Board, players: [Player]) {
        self.board = board
        self.rules = ClassicRules(row: board.nbreRow, column: board.nbreColumn)
        self.players = players
    }
    
   public init(board: Board, rules: Rules, players: [Player]) {
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
    public func play() {
        while !rules.isGameOver(board.grid) {
            // Boucle jusqu'à ce que la partie soit terminée en utilisant la méthode isGameOver() du objet rules pour vérifier l'état du plateau de jeu.

            let currentPlayer = players[currentPlayerIndex % players.count]
            // Récupère le joueur actuel en utilisant l'index courant et en le modulant par le nombre de joueurs.

           
            var column: Int?
            repeat {
                if currentPlayer.type != TypePlayer.IA {
                    // Si le type de joueur actuel n'est pas une intelligence artificielle, demander à l'utilisateur de choisir une colonne.
                    print("C'est au tour du joueur \( (currentPlayer as! Human).getName() )")
                    // Affiche une notification pour informer le joueur actuel qu'il est son tour.
                    column = Inputer.inputNumber("Choisissez une colonne (0-\(board.nbreColumn - 1)): ")
                } else {
                    // Sinon, c'est un joueur contrôlé par l'IA.

                    //Outputer.printNumber("IA\n")
                    
                    column = Inputer.inputNumberIA(lowerBound: 0, upperBound: board.nbreColumn-1)

                    
                }
                if rules.isGameOver(board.grid) { break}
            } while !rules.isValidMove(column: column!, grid: board.grid)
            // Boucle jusqu'à ce qu'un mouvement valide soit sélectionné en utilisant la méthode isValidMove() du objet rules pour vérifier la validité du mouvement.

            _ = rules.getNextRow(column: column!, grid: board.grid)
            // Récupère la prochaine ligne disponible dans la colonne choisie en utilisant la méthode getNextRow() du objet rules.

            board.insertPiecce(col: column!, id: currentPlayer.id)
            // Met à jour la grille avec le nouveau mouvement en assignant l'identifiant du joueur actuel à la case correspondante.

            Outputer.printResult(tabResult: board.grid)
            // Affiche le nouvel état de la grille de jeu en utilisant la méthode printResult() de l'objet Outputer.

            currentPlayerIndex += 1
            // Incrémente l'index courant pour passer au joueur suivant.
         
            if rules.isGameOver(board.grid) {
                Outputer.printNumber("JOUEUR ID = \(currentPlayer)")
                break
                
            }
            if(board.isFull()) { break }
        }
       
        print("Partie terminée!")
        // Affiche une notification pour informer que la partie est terminée.
    }


}
    
    
 
