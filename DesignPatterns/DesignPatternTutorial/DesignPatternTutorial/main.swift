struct Main {
    func observer() {
        let observerInstance = Observer()
        let testChambers = TestChambers(observer: observerInstance)
        testChambers.testChamberNumber += 1
    }
}

let main = Main()
main.observer()
