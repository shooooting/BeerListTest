//
//  BeerBasicViewModel.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/04.
//

import UIKit

class BeerBasicViewModel {
    
    private let beerBasic: Ingredients
    private let beerBasicMalt: [Ingredients.Malt]
    private let beerBasicHops: [Ingredients.Hops]
    
    var ingredientsMaltString: String {
        var str = String()
        for i in beerBasicMalt.indices {
            str.append("\(beerBasicMalt[i].name), ")
        }
        let drop_last = String(str.dropLast(2))
        return "Malt: \(drop_last)"
    }
    
    var ingredientsHopsString: String {
        var str = String()
        for i in beerBasicHops.indices {
            str.append("\(beerBasicHops[i].name), ")
        }
        let drop_last = String(str.dropLast(2))
        return "Hops: \(drop_last)"
    }
    
    var ingredientsYeastString: String {
        return "Yeast: \(beerBasic.yeast)"
    }
    
    init(beerBasic: Ingredients) {
        self.beerBasic = beerBasic
        self.beerBasicMalt = beerBasic.malt
        self.beerBasicHops = beerBasic.hops
        
    }
}
