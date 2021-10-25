import XCTest

final class Tests: XCTestCase {
    private var game: Game!
    
    override func setUp() {
        game = Game()
    }
    
    func test_can_roll() {
        game.roll(0)
    }
    
    private func rollMany(rolls: Int, pins: Int) {
        for _ in 1...rolls {
            game.roll(pins)
        }
    }
    
    func test_gutter_game() {
        rollMany(rolls: 20, pins: 0)
        
        let result = game.score()
        let expectedValue = 0
        
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_allOnes() {
        rollMany(rolls: 20, pins: 1)
        
        let result = game.score()
        let expectedValue = 20
        
        XCTAssertEqual(result, expectedValue)
    }
    
    func test_oneSpare() {
        rollSpare()
        game.roll(3)
        rollMany(rolls: 17, pins: 0)
        
        let result = game.score()
        let expectedValue = 16
        
        XCTAssertEqual(result, expectedValue)
    }
    
    private func rollSpare() {
        game.roll(5)
        game.roll(5)
    }
    
    func test_oneStrike() {
        rollStrike()
        game.roll(5)
        game.roll(3)
        rollMany(rolls: 16, pins: 0)
        
        let result = game.score()
        let expectedValue = 26
        
        XCTAssertEqual(result, expectedValue)
    }
    
    private func rollStrike() {
        game.roll(10)
    }
    
    func test_perfectGame() {
        rollMany(rolls: 12, pins: 10)
        
        let result = game.score()
        let expectedValue = 300
        
        XCTAssertEqual(result, expectedValue)
    }
}
