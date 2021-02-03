//
//  BeerImageView.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit

class BeerImageView: UIView {
    
    init(image: UIImageView, string: UILabel, backgroundColor: UIColor, fontSize: CGFloat) {
        super.init(frame: .zero)
        
        let blackBar = UIView()
        
        [image, blackBar, string].forEach {
            addSubview($0)
        }
        
        image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(10)
            $0.width.equalTo(80)
            $0.height.equalTo(100)
        }
        
        blackBar.backgroundColor = .black
        blackBar.snp.makeConstraints {
            $0.top.equalTo(image.snp.bottom).offset(8)
            $0.leading.width.bottom.trailing.equalToSuperview()
            $0.height.equalTo(54)
        }
        
        string.font = UIFont(name: "AppleSDGothicNeo-bold", size: fontSize)
        string.numberOfLines = 0
        string.textColor = .white
        string.snp.makeConstraints {
            $0.center.equalTo(blackBar)
            $0.width.equalTo(self.snp.width).multipliedBy(0.85)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
