//
//  JuiceMaker - JuiceMaker.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation
import UIKit

struct JuiceMaker {
    private let fruitStore: FruitStore = FruitStore()
    
    func fetchAllStock() -> [Fruit.Name: Int] {
        return fruitStore.fetchAllStock()
    }
    
    func make(_ juice: JuiceMenu) -> Bool {
        var validStock: Int = 0
        
        for juice in juice.ingredients {
            validStock = fruitStore.checkStock(for: juice) ? validStock + 1 : validStock + 0
        }
        
        if validStock != juice.ingredients.count {
            return false
        }
        
        for juice in juice.ingredients {
            fruitStore.consumeStock(of: juice)
        }
        
        return true
    }
    
    func updateStore(to requiredChange: Fruit) -> Bool {
        guard fruitStore.updateQuantity(to: requiredChange) else {
            print(AlertMessage.updateFailMessage.description)
            return false
        }

        return true
    }
    
}

