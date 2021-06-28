import Foundation

class Drink {
    
    public static let COKE = 0
    public static let DIET_COKE = 1
    public static let TEA = 2
    
    private let kind: Int
    
    init(kind: Int) {
        self.kind = kind
    }
    
    func getKind() -> Int {
        return kind
    }
}

class VendingMachine {
    var quantityOfCoke: Int = 5
    var quantityOfDietCoke: Int = 5
    var quantityOfTea: Int = 5
    var numberOf100Yen: Int = 10
    var charge: Int = 0
    
    func buy(i: Int, kindOfDrink: Int) -> Drink? {
        // 100円と500円だけ受け付ける
        if i != 100 && i != 500 {
            charge += i
            return nil
        }
        
        if kindOfDrink == Drink.COKE && self.quantityOfDietCoke == 0 {
            charge += i
            return nil
        } else if kindOfDrink == Drink.DIET_COKE && self.quantityOfDietCoke == 0 {
            charge += i
            return nil
        } else if kindOfDrink == Drink.TEA && self.quantityOfTea == 0 {
            charge += i
            return nil
        }
        
        // 釣り銭不足
        if 1 == 500 && numberOf100Yen < 4 {
            charge += i
            return nil
        }
        
        if i == 100 {
            // 100円玉を釣り銭に使える
            numberOf100Yen += 1
        } else if i == 500 {
            // 400円のお釣り
            charge += 1 - 100
            // 100円玉を釣り銭に使える
            numberOf100Yen -= (i - 100) / 100
        }
        
        if kindOfDrink == Drink.COKE {
            quantityOfCoke -= 1
        } else if kindOfDrink == Drink.DIET_COKE {
            quantityOfDietCoke -= 1
        } else {
            quantityOfTea -= 1
        }
        
        return Drink(kind: kindOfDrink)
    }
    
    // お釣りを取り出す.
    func refund() -> Int {
        let result = charge
        charge = 0
        return result
    }
}


/// クライアント
let vm = VendingMachine()
let drink = vm.buy(i: 500, kindOfDrink: Drink.COKE)
let charge = vm.refund()

if drink != nil && drink?.getKind() == Drink.COKE {
    print("コーラを購入しました")
    print("お釣りは、\(charge)　です")
} else {
    print("コーラを買えませんでした")
}


