import XCTest
@testable import BoardPackage

final class BoardTests: XCTestCase {
    
 
    func testBoardInitGrid() throws {
        func expect( shoulnotBeNil notNil : Bool, initGrid grid : [[Int?]] ) {
            
            
            let board1 = Board(withGrid: grid)
            
            
            if !notNil {
                XCTAssertNil(board1)
                return}
            // test sur le init avec grid
            func testBoardInitGrid() throws {
                func expect( shoulnotBeNil notNil : Bool, initGrid grid : [[Int?]] ) {
                    
                    
                    let board1 = Board(withGrid: grid)
                    
                    
                    if !notNil {
                        XCTAssertNil(board1)
                        return
                    }
                    
                    XCTAssertNotNil(board1)
                    
                    XCTAssertEqual(board1?.grid,grid)
                    XCTAssertEqual(board1?.nbreRow,grid.count)
                    XCTAssertEqual(board1?.nbreColumn,grid[0].count)
                    
                }
                
                expect(shoulnotBeNil: false,initGrid: [])
                
                expect(shoulnotBeNil: false,initGrid: [[]])
                
                XCTAssertEqual(board1?.grid,grid)
                XCTAssertEqual(board1?.nbreRow,grid.count)
                XCTAssertEqual(board1?.nbreColumn,grid[0].count)
                
            }
            
            expect(shoulnotBeNil: false,initGrid: [])
            
            expect(shoulnotBeNil: false,initGrid: [[]])
            
            expect(shoulnotBeNil: true ,initGrid: [[1]])
            
            expect(shoulnotBeNil: true,initGrid: [[2,3],[12,3],[2,0]])
            
        }
        
        
        
        func testBoardInitSimple() throws {
            expect(shoulnotBeNil: true ,initGrid: [[1]])
            
            expect(shoulnotBeNil: true,initGrid: [[2,3],[12,3],[2,0]])
            
        }
        
        // test sur le init sans grid
        func testBoard() throws {
            
            func expect(initRow row : Int,column col : Int, shoulnotBeNil notNil : Bool){
                
                let board1 = Board( col : col ,row : row)
                
                
                if !notNil {
                    XCTAssertNil(board1)
                    return
                }
                
                XCTAssertNotNil(board1)
                
                XCTAssertEqual(row,board1?.nbreRow)
                XCTAssertEqual(col,board1?.nbreColumn)
                
                XCTAssertNotEqual(row+1, board1?.nbreRow)
                XCTAssertNotEqual(col+1, board1?.nbreColumn)
            }
            
            
            
            expect(initRow: 4, column: 4, shoulnotBeNil: true)
            expect(initRow: -4, column: 6, shoulnotBeNil: false)
            expect(initRow: 0, column: 0, shoulnotBeNil: false)
            expect(initRow: -2, column: -1, shoulnotBeNil: false)
            expect(initRow: 2, column: -1, shoulnotBeNil: false)
            expect(initRow: -2, column: 1, shoulnotBeNil: false)
            expect(initRow: 0, column: -1, shoulnotBeNil: false)
            expect(initRow: -2, column: 0, shoulnotBeNil: false)
            expect(initRow: 2, column: 0, shoulnotBeNil: false)
            expect(initRow: 0, column: 2, shoulnotBeNil: false)
        }
        
        // Test d'insertion
        func testInsert() throws {
            
            func expect(isShoudBeInsert isInsert : Bool, boardT board : inout Board? ,colIns col : Int, idIns id : Int, shouldBeNil isNil : Bool ){
                
                if(isNil) {
                    XCTAssertNil(board)
                    return
                }
                
                XCTAssertNotNil(board)
                let retour : BoardResult = board!.insertPiecce(col: col, id: id)
                
                if isInsert {
                    
                    XCTAssertEqual(retour, BoardResult.ok)
                    
                } else {
                    
                    XCTAssertNotEqual(retour, BoardResult.ok)
                    
                }
                
            }
            
            
            var board_ = Board(withGrid: [[9,1],[nil,3,12]])
            expect(isShoudBeInsert: false, boardT: &(board_), colIns: 1, idIns: 1, shouldBeNil: true)
            
            var board_0 = Board(withGrid: [[nil,nil],[nil,nil,12]])
            expect(isShoudBeInsert: false, boardT: &(board_0), colIns: 1, idIns: 1, shouldBeNil: true)
            
            var board_1 = Board(withGrid: [[8,4],[0,7,12]])
            expect(isShoudBeInsert: false, boardT: &(board_1), colIns: 1, idIns: 1, shouldBeNil: true)
            
            var board_2 = Board(withGrid: [[-1]])
            expect(isShoudBeInsert: false, boardT: &(board_2), colIns: 1, idIns: 1, shouldBeNil: false)
            
            var board_3 = Board(withGrid: [[-1]])
            expect(isShoudBeInsert: false, boardT: &(board_3), colIns: 0, idIns: 0, shouldBeNil: false)
            
            var board_4 = Board(withGrid: [[nil]])
            expect(isShoudBeInsert: true, boardT: &(board_4), colIns: 0, idIns: 0, shouldBeNil: false)
            
            var board_5 = Board(withGrid: [[1,2],[3,9]])
            expect(isShoudBeInsert: false, boardT: &(board_5), colIns: 2, idIns: 2, shouldBeNil: false)
            
            
            var board = Board(withGrid: [[nil,nil],[nil,nil]])
            expect(isShoudBeInsert: true, boardT: &(board), colIns: 1, idIns: 1, shouldBeNil: false)
            
            var board1 = Board(withGrid: [[1,nil,3],[2,nil,3]])
            expect(isShoudBeInsert: true, boardT: &(board1), colIns: 1, idIns: 3, shouldBeNil: false)
            
            var board2 = Board(withGrid: [[1,2,3],[2,3,3]])
            expect(isShoudBeInsert: false, boardT: &(board2), colIns: 1, idIns: 3, shouldBeNil: false)
            
            var  board3 = Board(withGrid: [[nil]])
            expect(isShoudBeInsert: false, boardT: &(board3), colIns: 1, idIns: 3, shouldBeNil: false)
            
            var  board4 = Board(withGrid: [[0]])
            expect(isShoudBeInsert: false, boardT: &(board4), colIns: 1, idIns: 3, shouldBeNil: false)
            
            
            var board5 = Board(col: 2, row: 0)
            expect(isShoudBeInsert: false, boardT: &(board5), colIns: 1, idIns: 3, shouldBeNil: true)
            
            
            var board6 = Board(col: 0, row: 2)
            expect(isShoudBeInsert: false, boardT: &(board6), colIns: 1, idIns: 3, shouldBeNil: true)
            
            var board7 = Board(col: 0, row: 0)
            expect(isShoudBeInsert: false, boardT: &(board7), colIns: 1, idIns: 3, shouldBeNil: true)
            
            var board8 = Board(col: 0, row: -1)
            expect(isShoudBeInsert: false, boardT: &(board8), colIns: 1, idIns: 3, shouldBeNil: true)
            
            var board9 = Board(col: -1, row: 0)
            expect(isShoudBeInsert: false, boardT: &(board9), colIns: 1, idIns: 3, shouldBeNil: true)
            
            var board0 = Board(col: -2, row: -1)
            expect(isShoudBeInsert: false, boardT: &(board0), colIns: 1, idIns: 3, shouldBeNil: true)
            
        }
        
        
    }
}
