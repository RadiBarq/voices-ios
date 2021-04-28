//
//  VoicesApp.swift
//  Shared
//
//  Created by Radi Barq on 18/04/2021.
//

import SwiftUI
import Firebase

@main
struct VoicesApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            LoginScene()
        }
    }
}
