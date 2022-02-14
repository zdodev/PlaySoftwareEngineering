struct Main {
    func observer() {
        let observerInstance = Observer()
        let testChambers = TestChambers(observer: observerInstance)
        testChambers.testChamberNumber += 1
    }
    
    func adapter() {
        let target = OldDeathStarSuperlaserTarget(angleHorizontal: 14.0, angleVertical: 12.0)
        let newFormat = NewDeathStarSuperlaserTarget(target)
        
        print(newFormat.angleH, newFormat.angleV)
    }
}

let main = Main()
main.adapter()
