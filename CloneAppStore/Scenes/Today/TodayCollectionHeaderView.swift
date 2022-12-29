//
//  TodayCollectionHeaderView.swift
//  CloneAppStore
//
//  Created by 1 on 2022/12/29.
//

import UIKit
import SnapKit


final class TodayCollectionHeaderView: UICollectionReusableView {
    private lazy var dateLabel: UILabel = {
       let label = UILabel()
        label.text = "6월 28일 월요일"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.text = "투데이 커멘드~"
        label.font = .systemFont(ofSize: 36, weight: .black)
        label.textColor = .label
        return label
    }()
    
    func setUpViews() {
        [dateLabel, titleLabel].forEach({ addSubview($0) })
        
        dateLabel.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview().inset(32)
        })
        
        titleLabel.snp.makeConstraints({
            $0.left.equalTo(dateLabel)
            $0.top.equalTo(dateLabel.snp.bottom).offset(8)
        })
    }
    
    
}
