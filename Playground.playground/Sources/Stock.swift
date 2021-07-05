import Foundation

public class Stock {
    
    private var quantity: Int
    
    public init(quantity: Int) {
        self.quantity = quantity
    }
    
    public func getQuantity() -> Int {
        return quantity
    }
    
    public func decrement() {
        self.quantity -= 1
    }
}
