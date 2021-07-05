import Foundation

public class Drink {
    
    private var kind: DrinkType
    
    init(kind: DrinkType) {
        self.kind = kind
    }
    
    public func isCoke() -> Bool {
        return kind == DrinkType.COKE
    }
    
    public func isDietCoke() -> Bool {
        return kind == DrinkType.DIET_COKE
    }
    
    public func isTea() -> Bool {
        return kind == DrinkType.TEA
    }
}
