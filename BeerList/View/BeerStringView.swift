//
//  BeerStringLabel.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit

class BeerStringView: UIView {
    
    init(string: UILabel) {
        super.init(frame: .zero)
        
        addSubview(string)
        
        string.font = UIFont(name: "AppleSDGothicNeo-bold", size: 16)
        string.numberOfLines = 0
        string.textColor = .white
        
        string.snp.makeConstraints {
            $0.center.top.equalToSuperview()
            $0.width.equalTo(self.snp.width).multipliedBy(0.85)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
