//
//  AppViewController.swift
//  CloneAppStore
//
//  Created by 1 on 2022/12/29.
//

import UIKit
import SnapKit


final class AppViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationController()
    }
}


private extension AppViewController {
    func setUpNavigationController() {
        navigationItem.title = "앱뷰"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
