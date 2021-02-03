//
//  TableViewCellBeerBasicView.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/04.
//

import UIKit

class TableViewCellBeerBasicView: UIView {
    
    var basicBeerData: Ingredients? {
        didSet { configure() }
    }
    
    private lazy var maltView = BeerStringView(string: maltLabel)
    private let maltLabel = UILabel()
    
    private lazy var hopsView = BeerStringView(string: hopsLabel)
    private let hopsLabel = UILabel()
    
    private lazy var yeastView = BeerStringView(string: yeastLabel)
    private let yeastLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        [maltView, hopsView, yeastView].forEach {
            addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview()
            }
        }
        
        maltView.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        hopsView.snp.makeConstraints {
            $0.top.equalTo(maltView.snp.bottom).offset(8)
        }
        
        yeastView.snp.makeConstraints {
            $0.top.equalTo(hopsView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        guard let beer = basicBeerData else { return }
        let viewModel = BeerBasicViewModel(beerBasic: beer)
        
        maltLabel.text = viewModel.ingredientsMaltString
        hopsLabel.text = viewModel.ingredientsHopsString
        yeastLabel.text = viewModel.ingredientsYeastString
    }
}
