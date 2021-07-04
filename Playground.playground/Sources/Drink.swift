import Foundation

open class Drink {
    
    public static let COKE = 0
    public static let DIET_COKE = 1
    public static let TEA = 2
    
    private let kind: Int
    
    public init(kind: Int) {
        self.kind = kind
    }
    
    public func getKind() -> Int {
        return kind
    }
}
