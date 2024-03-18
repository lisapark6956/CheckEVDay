//
//  User.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
