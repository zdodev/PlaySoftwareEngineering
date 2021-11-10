import Foundation

struct StringCalculator {
    func add(_ numbers: String) -> Int {
        if numbers.isEmpty {
            return 0
        }
        
        let result = numbers.components(separatedBy: [",", "\n", ";", "\\"])
            .map { element in
                Int(element)!
            }
            .reduce(0) { partialResult, element in
                partialResult + element
            }
        
        
        return result
    }
}
