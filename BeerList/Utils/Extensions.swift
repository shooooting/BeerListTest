//
//  Extensions.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit

// MARK: - Navigation
extension UIViewController {
    
    func setNavigation() {
        let appearance = UINavigationBarAppearance()
        
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.backgroundColor = .purple
        
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Beer List"
        navigationController?.navigationBar.tintColor = .white
    }
}
