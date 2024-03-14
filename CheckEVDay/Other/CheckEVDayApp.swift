//
//  CheckEVDayApp.swift
//  CheckEVDay
//
//  Created by 정은 on 3/14/24.
//

import SwiftUI
import SwiftData
import FirebaseCore

@main
struct CheckEVDayApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
