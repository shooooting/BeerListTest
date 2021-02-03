//
//  TableViewCell.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Propertise
    var beer: BeerListModel? {
        didSet {
            configure()
            beerBasic.basicBeerData = beer?.ingredients
        }
    }
    
    private lazy var taglineView = BeerStringView(string: taglineLabel)
    private let taglineLabel = UILabel()
    
    private lazy var descriptionView = BeerStringView(string: descruptionLabel)
    private let descruptionLabel = UILabel()
    
    private lazy var abvView = BeerStringView(string: abvLabel)
    private let abvLabel = UILabel()
    
    private lazy var ibuView = BeerStringView(string: ibuLabel)
    private let ibuLabel = UILabel()
    
    private lazy var srmView = BeerStringView(string: srmLabel)
    private let srmLabel = UILabel()
    
    private let beerBasic = TableViewCellBeerBasicView()
    
    private lazy var foodPairingView = BeerStringView(string: foodPairingLabel)
    private let foodPairingLabel = UILabel()
    
    private lazy var brewersTipsView = BeerStringView(string: brewersTipsLabel)
    private let brewersTipsLabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - configure
    private func configure() {
        guard let beer = beer else { return }
        let viewModel = BeerViewModel(beer: beer)
        
        taglineLabel.text = viewModel.taglineString
        descruptionLabel.text = viewModel.descriptionString
        abvLabel.text = viewModel.abvString
        ibuLabel.text = viewModel.ibuString
        srmLabel.text = viewModel.srmString
        foodPairingLabel.text = viewModel.foodPairingString
        brewersTipsLabel.text = viewModel.brewersTipsString
    }
}

// MARK: - setUI
extension TableViewCell {
    private func setUI() {
        [taglineView, descriptionView, abvView, ibuView, srmView, beerBasic, foodPairingView, brewersTipsView].forEach {
            contentView.addSubview($0)
            $0.snp.makeConstraints {
                $0.leading.trailing.equalToSuperview()
            }
        }
        
        taglineView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
        }
        
        descriptionView.snp.makeConstraints {
            $0.top.equalTo(taglineView.snp.bottom).offset(8)
        }
        
        abvView.snp.makeConstraints {
            $0.top.equalTo(descriptionView.snp.bottom).offset(8)
        }
        
        ibuView.snp.makeConstraints {
            $0.top.equalTo(abvView.snp.bottom).offset(8)
        }
        
        srmView.snp.makeConstraints {
            $0.top.equalTo(ibuView.snp.bottom).offset(8)
        }
        
        beerBasic.snp.makeConstraints {
            $0.top.equalTo(srmView.snp.bottom).offset(8)
        }
        
        foodPairingView.snp.makeConstraints {
            $0.top.equalTo(beerBasic.snp.bottom).offset(8)
        }
        
        brewersTipsView.snp.makeConstraints {
            $0.top.equalTo(foodPairingView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
