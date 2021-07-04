import Foundation

open class Drink {
    
    public static let COKE = 0
    public static let DIET_COKE = 1
    public static let TEA = 2
    
    private let kind: DrinkType
    
    public init(kind: DrinkType) {
        self.kind = kind
    }
    
    public func getKind() -> DrinkType {
        return kind
    }
}
