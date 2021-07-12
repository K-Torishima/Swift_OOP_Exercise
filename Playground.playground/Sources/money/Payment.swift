import Foundation

public class Payment {
    
    private var change: Change
    private var coin: Coin
    
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    func needChange() -> Bool {}
    
    
    func commit(cashBox: CashBox) {
        
    }
    
    
    
}
