import Foundation

class VendingMachine {
    var stockOfCoke: Stock = Stock(quantity: 5)
    var stockOfDietCoke:Stock = Stock(quantity: 5)
    var stockityOfTea: Stock = Stock(quantity: 5)
    var stockOf100Yen: Int = 10
    var charge: Int = 0
    
    func buy(payment: Int, selectOfDrink: DrinkType) -> Drink? {
        // 100円と500円だけ受け付ける
        if payment != 100 && payment != 500 {
            charge += payment
            return nil
        }
        
        if selectOfDrink == DrinkType.COKE && stockOfCoke.getQuantity() == 0 {
            charge += payment
            return nil
        } else if selectOfDrink == DrinkType.DIET_COKE && stockOfDietCoke.getQuantity() == 0 {
            charge += payment
            return nil
        } else if selectOfDrink == DrinkType.TEA && stockityOfTea.getQuantity() == 0 {
            charge += payment
            return nil
        }
        
        // 釣り銭不足
        if payment == 500 && stockOf100Yen < 4 {
            charge += payment
            return nil
        }
        
        if payment == 100 {
            // 100円玉を釣り銭に使える
            stockOf100Yen += 1
        } else if payment == 500 {
            // 400円のお釣り
            charge += payment - 100
            // 100円玉を釣り銭に使える
            stockOf100Yen -= (payment - 100) / 100
        }
        
        if selectOfDrink == DrinkType.COKE {
            stockOfCoke.decrement()
        } else if selectOfDrink == DrinkType.DIET_COKE {
            stockOfDietCoke.decrement()
        } else {
            stockityOfTea.decrement()
        }
        
        return Drink(kind: selectOfDrink)
    }
    
    // お釣りを取り出す.
    func refund() -> Int {
        let result = charge
        charge = 0
        return result
    }
}


/// クライアント
struct Client {
    func main(money: Int, select: DrinkType) {
        let vm = VendingMachine()
        let drink = vm.buy(payment: money, selectOfDrink: select)
        let charge = vm.refund()
        
        if drink != nil && drink?.getKind() == select {
            print("\(select)を購入しました")
            print("お釣りは、\(charge)　です")
        } else {
            print("\(select)は買えませんでした")
        }
    }
}

let client = Client()
client.main(money: 500, select: DrinkType.COKE)
