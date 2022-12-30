//
//  RankingFeatureSectionView.swift
//  CloneAppStore
//
//  Created by 1 on 2022/12/30.
//

import UIKit
import SnapKit


final class RankingFeatureSectionView: UIView {
    private let cellHeight: CGFloat = 30
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .black)
        label.text = "iPhone이 처음리면"
        return label
    }()
    
    private lazy var showAllAppButton: UIButton = {
        let button = UIButton()
        button.setTitle("모두보기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize:14, weight: .semibold)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 32
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "RankingFeatureCollectionViewCell")
        
        return collectionView
    }()
    
    private let separatorView = SeparatiorView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension RankingFeatureSectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: cellHeight)
    }
    
    
}

extension RankingFeatureSectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RankingFeatureCollectionViewCell", for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell //?? UICollectionViewCell()
    }
}



private extension RankingFeatureSectionView {
    func setupView() {
        [titleLabel, showAllAppButton, collectionView, separatorView].forEach { addSubview($0) }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
            $0.trailing.equalTo(showAllAppButton.snp.leading).offset(8)
        }
        
        showAllAppButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(titleLabel.snp.bottom)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.height.equalTo(cellHeight * 3) // * n 개만큼 셀 표기가됨
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        separatorView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(16)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
