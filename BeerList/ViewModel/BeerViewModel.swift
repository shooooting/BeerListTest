//
//  BeerViewModel.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit

class BeerViewModel {
    
    private let beer: BeerListModel
    
    var taglineString: String {
        return "Tag Line: \(beer.tagline)"
    }
    
    var descriptionString: String {
        return "Description: \(beer.description)"
    }
    
    var abvString: String {
        guard let abv = beer.abv else { return "0 ℃" }
        return "abv: \(abv) ℃ (알콜도수)"
    }
    
    var ibuString: String {
        guard let ibu = beer.ibu else { return "-" }
        return "ibu: \(ibu) (쓴 맛의 정도)"
    }
    
    var srmString: String {
        guard let srm = beer.srm else { return "-" }
        return "srm: \(srm) (색의 짙음)"
    }
    
    var foodPairingString: String {
        var str = String()
        for i in beer.food_pairing.indices {
            str.append("\(beer.food_pairing[i]), ")
        }
        let drop_last = String(str.dropLast(2))
        return "foodPairing: \(drop_last)"
    }
    
    var brewersTipsString: String {
        return "brewersTips: \(beer.brewers_tips)"
    }
    
    init(beer: BeerListModel) {
        self.beer = beer
    }
}
