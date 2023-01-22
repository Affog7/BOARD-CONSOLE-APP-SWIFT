import XCTest
@testable import BoardPackage

final class BoardTests: XCTestCase {
    
    func testBoardInit() throws {
        func expect(initRow row : Int,column col : Int, shoulnotBeNil notNil : Bool, initGrid grid : [[Int?]] ) {
            
            
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
        
        
    }
 
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
        
    
           
}
