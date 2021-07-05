import Foundation

public struct Coin {
    public static let ONE_HUNDRED = 100
    public static let FIVE_HUNDRED = 500
    private let amount: Int

    init(amount: Int) {
        self.amount = amount
    }
    
    public func toMoney() -> Money {
        return Money(amount: self.amount)
    }
}

