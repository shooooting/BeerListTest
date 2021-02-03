//
//  CollectionViewCell.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static let identifier = "MyMovieCollectionViewCell"
    
    var id: Int? {
        didSet {
            setBeerList()
        }
    }
    
    private var beer: [BeerListModel]? {
        didSet {
            guard let beer = beer?[0] else { return }
            guard let url = URL(string: beer.image_url) else { return }
            beerImage.kf.setImage(with: url)
            stringLabel.text = beer.name
            tableView.reloadData()
        }
    }
    
    private let tableView = UITableView()
    private lazy var beerImageView = BeerImageView(image: beerImage,
                                                   string: stringLabel,
                                                   backgroundColor: .clear, fontSize: 16)
    
    private let beerImage = UIImageView()
    private let stringLabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUI()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setBeerList() {
        guard let id = self.id else { return }
        Service.shared.beerIdDataUpdata(id: id) { beerData in
            guard let idBeerData = beerData else { return }
            self.beer = idBeerData
        }
    }
    
    // MARK: - setUI
    private func setUI() {
        self.layer.cornerRadius = 10
        self.backgroundColor = .systemGray6
        
        [tableView, beerImageView].forEach {
            contentView.addSubview($0)
        }
        
        beerImageView.backgroundColor = .clear
        beerImageView.snp.makeConstraints {
            $0.height.equalToSuperview().multipliedBy(0.4)
            $0.top.width.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(beerImageView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - setTableView
extension CollectionViewCell {
    private func setTableView() {
        
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        
        tableView.dataSource = self
    }
}

// MARK: - tableviewDatasource
extension CollectionViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beer?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell()
        cell.backgroundColor = .clear
        cell.beer = self.beer?[indexPath.row]
        return cell
    }
}
