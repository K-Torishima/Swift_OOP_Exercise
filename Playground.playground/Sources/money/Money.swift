import Foundation

public class Money {
    
    private let amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    public func add(money: Money) -> Money {
        return Money(amount: self.amount + money.amount)
    }
    
    public func toString() -> String {
        return String(self.amount)
    }
}
