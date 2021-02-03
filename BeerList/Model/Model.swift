//
//  Model.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import Foundation

// MARK: - 전체 맥주 데이터 가져오기

struct BeerListModel: Decodable {
    let id: Int
    let name: String
    let tagline: String
    let description: String
    let image_url: String
    let abv: Double? // 알콜도수
    let ibu: Double? // 쓴 맛의 정도 값이 높으면 쓰다.
    let srm: Double? // 색의 짙은 정도 숫자가 높으면 짙다.
    let ingredients: Ingredients
    let food_pairing: [String]
    let brewers_tips: String
    
}

struct Ingredients: Decodable { // 맥주 원재료
    let malt: [Malt]
    let hops: [Hops]
    let yeast: String// 효모
    
    struct Malt: Decodable { // 맥아
        let name: String
    }
    
    struct Hops: Decodable { // 홉
        let name: String
    }
}



