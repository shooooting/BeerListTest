//
//  ViewController.swift
//  BeerList
//
//  Created by ㅇ오ㅇ on 2021/02/03.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    private var beerListData = [BeerListModel]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        return UICollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    private var currentIndex: CGFloat = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
        setCollectionView()
        setBeerList()
        view.backgroundColor = .white
        
    }
    
    private func addData() {
        if beerListData.count > 24 {
            setBeerList()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerListData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .systemPurple
        cell.id = beerListData[indexPath.row].id
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let cellWidthIncludingSpacing = view.frame.width - Standard.inset.left - Standard.inset.right + Standard.space
        //330 view에 width값에서 collectionView의 size값을 줄때 뺐던 left값과 right값을 빼줬다. 그리고 cell간의 간격을 더해주면서 다음 cell의 가운데 값이 되도록 해준다.
//        print(cellWidthIncludingSpacing)
        var offset = targetContentOffset.pointee // 이동했을때의 값을 좌표값으로 바꿔줌
        //targetContentOffset - 스크롤 속도가 줄어들어 정지될 때 예상되는 위치를 찍어줌
        let index = offset.x / cellWidthIncludingSpacing
//        print(index)
        var roundedIndex = round(index)//반올림
        
        print(scrollView.contentOffset.x)// cell에 x위치
//        print(targetContentOffset.pointee.x)
        if scrollView.contentOffset.x > targetContentOffset.pointee.x {
            roundedIndex = floor(index)//내림
        } else if scrollView.contentOffset.x < targetContentOffset.pointee.x {
            roundedIndex = ceil(index)//올림
        } else {
            roundedIndex = round(index)//반올림
        }
        
        if currentIndex > roundedIndex {
            currentIndex -= 1
            roundedIndex = currentIndex
        } else if currentIndex < roundedIndex {
            currentIndex += 1
            roundedIndex = currentIndex
        }
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing, y: -scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

extension MainViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        
        for indexPath in indexPaths {
            if beerListData.count - 4  == indexPath.row {
                self.addData()
            }
        }
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    private struct Standard {
        static let space: CGFloat = 15
        static let inset: UIEdgeInsets = .init(top: 20, left: 30, bottom: 20, right: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Standard.inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Standard.space
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - Standard.inset.left - Standard.inset.right
        let height = collectionView.frame.height - Standard.inset.top - Standard.inset.bottom
        return CGSize(width: width, height: height)
    }
}

// MARK: - API
extension MainViewController {
    private func setBeerList() {
        Service.shared.beerListUpdate { beerList in
            guard let beerListData = beerList else { return }
            self.beerListData.append(contentsOf: beerListData)
        }
    }
}

// MARK: - collectionView
extension MainViewController {
    
    private func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.prefetchDataSource = self
        
        collectionView.register(CollectionViewCell.self,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    
}
