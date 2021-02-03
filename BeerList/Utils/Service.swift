//
//  Service.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import Foundation
import Alamofire

struct Service {
    
    static let shared = Service()
    
    private let decoder = JSONDecoder()
    private let BEER_LIST = "https://api.punkapi.com/v2/beers"
    
    func beerListUpdate(completion: @escaping([BeerListModel]?) -> Void) {
        AF.request(BEER_LIST, method: .get).responseJSON { response in
            guard let jsonData = response.data else { return completion(nil) }
            
            do {
                let responseData = try self.decoder.decode([BeerListModel].self, from: jsonData)
                completion(responseData)
            } catch {
                print("ERROR: BeerList ERROR, \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
    
    func beerIdDataUpdata(id: Int, completion: @escaping ([BeerListModel]?) -> Void) {
        let BEER_LIST_ID = BEER_LIST + "/\(id)"
        
        AF.request(BEER_LIST_ID, method: .get).responseJSON { response in
            guard let jsonData = response.data else { return }
            
            do {
                let responseData = try self.decoder.decode([BeerListModel].self, from: jsonData)
                completion(responseData)
            } catch {
                print("ERROR: BeerList ERROR, \(error.localizedDescription)")
                completion(nil)
            }
        }
    }
}
