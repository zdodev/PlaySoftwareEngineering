import Foundation

struct Calculator {
    private let delimiter = CharacterSet([",", "\n"])
    
    func calculate(_ input: String) throws -> Int {
        let numbers = input.components(separatedBy: delimiter)
        
        if isEmpty(input) {
            return 0
        }
        
        return try getSum(numbers)
    }
    
    private func getSum(_ numbers: [String]) throws -> Int {
        try findDangerousInput(numbers)
        
        return calculateValues(numbers)
    }
    
    private func calculateValues(_ numbers: [String]) -> Int {
        var sum = 0
        for nubmer in numbers {
            if stringToInt(nubmer) > 1000 {
                continue
            }
            
            sum += stringToInt(nubmer)
        }
        return sum
    }
    
    private func findDangerousInput(_ numbers: [String]) throws {
        for number in numbers {
            if stringToInt(number) < 0 {
                throw CalculatorError.negativeNumber
            }
        }
    }
    
    private func isEmpty(_ input: String) -> Bool {
        input.isEmpty
    }
    
    private func stringToInt(_ input: String) -> Int {
        Int(input)!
    }
}

enum CalculatorError: Error {
    case negativeNumber
}
