struct Game {
    private var rolls = Array(repeating: 0, count: 21)
    private var currentRoll = 0
    
    mutating func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    
    func score() -> Int {
        var point = 0
        var firstFrame = 0
        for _ in 0..<10 {
            if isStrike(firstFrame) {
                point += 10 + nextTwoBallsForStrike(firstFrame)
                firstFrame += 1
            } else if isSpare(firstFrame) {
                point += 10 + nextBallForSpare(firstFrame)
                firstFrame += 2
            } else {
                point += nextBallsInFrame(firstFrame)
                firstFrame += 2
            }
        }
        return point
    }
    
    private func nextBallsInFrame(_ firstFrame: Int) -> Int {
        rolls[firstFrame] + rolls[firstFrame + 1]
    }
    
    private func nextBallForSpare(_ firstFrame: Int) -> Int {
        rolls[firstFrame + 2]
    }
    
    private func nextTwoBallsForStrike(_ firstFrame: Int) -> Int {
        rolls[firstFrame + 1] + rolls[firstFrame + 2]
    }
    
    private func isSpare(_ firstFrame: Int) -> Bool {
        rolls[firstFrame] + rolls[firstFrame + 1] == 10
    }
    
    private func isStrike(_ firstFrame: Int) -> Bool {
        rolls[firstFrame] == 10
    }
}
