import Foundation

public class CashBox {
    var numberOf1OOyen: [Coin] = []
    
    func add(coin: Coin) {
        self.numberOf1OOyen.append(coin)
    }
    
    func doesNotHaveChange() -> Bool {
        return self.numberOf1OOyen.count > 4
    }
    
    
    func takeOutChange() -> Change {
        // ここちょっとむずい
    }
    
    var count: Int {
        return numberOf1OOyen.count
    }
}
