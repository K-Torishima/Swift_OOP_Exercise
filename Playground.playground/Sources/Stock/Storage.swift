import Foundation

public class Storage {
    
    var stocks: [DrinkType: Stock] = [:]
    
    init() {
        stocks = [.COKE: Stock(quantity: 5)]
        stocks = [.DIET_COKE: Stock(quantity: 5)]
        stocks = [.TEA: Stock(quantity: 5)]
    }
    
    public func doesNotHaveStock(kindOfDrink: DrinkType) -> Bool {
        return findStock(drinkType: kindOfDrink).isEmpty()
    }
    
    public func takeOut(kindOfDrink: DrinkType) -> Drink {
        let stock = findStock(drinkType: kindOfDrink)
        stock.decrement()
        return Drink(kind: kindOfDrink)
        
    }
    
    private func findStock(drinkType: DrinkType) -> Stock {
        return stocks[drinkType]!
    }
}
