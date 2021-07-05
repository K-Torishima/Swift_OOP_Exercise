import Foundation

public struct Coin {
    
    public enum CoinType: Int, CaseIterable {
        case ONE_HUNDRED = 100
        case FIVE_HUNDRED = 500
    }
    
    private var amount: Int
    
    init(amount: Int) {
        self.amount = amount
    }
    
    public func getAmount() -> Int {
        return amount
    }
}


