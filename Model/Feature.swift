//
//  Feature.swift
//  CloneAppStore
//
//  Created by 1 on 2023/01/01.
//

import Foundation


struct Feature: Decodable {
    let type: String
    let appName: String
    let description: String
    let imageURL: String
}
