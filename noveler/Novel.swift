//
//  Novel.swift
//  noveler
//
//  Created by User06 on 2020/5/14.
//  Copyright © 2020 bc. All rights reserved.
//

import Foundation

struct Novel: Identifiable, Codable {
    let id = UUID()
    var title: String
    var author: String
    var category: Int
    var read: Bool
}
