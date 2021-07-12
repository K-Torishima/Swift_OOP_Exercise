import Foundation

public class Change {
    private var coins: [Coin] = []
    
    init(payment: Coin) {
        self.coins.append(payment)
    }
    
    init(coins: [Coin]) {
        self.coins.append(contentsOf: coins)
    }
    
    public func getAmount() -> Money {
        return self.coins.map(Coin.toMoney).reduce(into: Money(amount: 0)) { sum, money in
            sum.add(money: money())
        }
    }
}
