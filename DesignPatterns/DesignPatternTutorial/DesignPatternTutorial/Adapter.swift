struct OldDeathStarSuperlaserTarget {
    let angleHorizontal: Float
    let angleVertical: Float
    
    init(angleHorizontal: Float, angleVertical: Float) {
        self.angleHorizontal = angleHorizontal
        self.angleVertical = angleVertical
    }
}

protocol NewDeathStarSuperLaserAiming {
    var angleV: Double { get }
    var angleH: Double { get }
}

struct NewDeathStarSuperlaserTarget: NewDeathStarSuperLaserAiming {
    private let target: OldDeathStarSuperlaserTarget
    
    init(_ target: OldDeathStarSuperlaserTarget) {
        self.target = target
    }
    
    var angleV: Double {
        Double(target.angleVertical)
    }
    
    var angleH: Double {
        Double(target.angleHorizontal)
    }
}
