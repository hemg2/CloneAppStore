//
//  TodayModel.swift
//  CloneAppStore
//
//  Created by 1 on 2022/12/31.
//

import Foundation


struct Today: Decodable {
    let title: String
    let subTitle: String
    let description: String
    let imageURL: String
}
