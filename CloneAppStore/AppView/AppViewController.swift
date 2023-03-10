//
//  AppViewController.swift
//  CloneAppStore
//
//  Created by 1 on 2022/12/29.
//

import UIKit
import SnapKit


final class AppViewController: UIViewController {
    private let scrollerView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0
        
        let featureSectionView = FeatureSectionView(frame: .zero)
        let rankingFeatureSectionView = RankingFeatureSectionView(frame: .zero)
        let exchangeCodeButtonView = ExchangeCodeButtonView(frame: .zero)
        //버튼 여유가없어서 임이의 뷰를 넣어서 여유있게 만든다.
        let spacingView = UIView()
        spacingView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
        
        [ featureSectionView, rankingFeatureSectionView, exchangeCodeButtonView, spacingView].forEach {
                stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
        setUpLayout()
    }
}


private extension AppViewController {
    func setUpNavigationController() {
        navigationItem.title = "앱뷰"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setUpLayout() {
        view.addSubview(scrollerView)
        scrollerView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        scrollerView.addSubview(contentView)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
