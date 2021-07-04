import Foundation

class VendingMachine {
    var stockOfCoke: Int = 5
    var stockOfDietCoke: Int = 5
    var stockityOfTea: Int = 5
    var stockOf100Yen: Int = 10
    var charge: Int = 0
    
    func buy(payment: Int, selectOfDrink: Int) -> Drink? {
        // 100円と500円だけ受け付ける
        if payment != 100 && payment != 500 {
            charge += payment
            return nil
        }
        
        if selectOfDrink == Drink.COKE && stockOfCoke == 0 {
            charge += payment
            return nil
        } else if selectOfDrink == Drink.DIET_COKE && stockOfDietCoke == 0 {
            charge += payment
            return nil
        } else if selectOfDrink == Drink.TEA && stockityOfTea == 0 {
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
        
        if selectOfDrink == Drink.COKE {
            stockOfCoke -= 1
        } else if selectOfDrink == Drink.DIET_COKE {
            stockOfDietCoke -= 1
        } else {
            stockityOfTea -= 1
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
    func main(money: Int, select: Int) {
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
client.main(money: 500, select: Drink.COKE)
