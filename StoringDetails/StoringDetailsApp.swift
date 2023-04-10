//
//  StoreDetailsApp.swift
//  StoreDetails
//
//  Created by Gaurav Bhardwaj on 10/04/23.
//

import SwiftUI
import Firebase



@main
struct StoreDetailsApp: App {
    
    init() {
            FirebaseApp.configure()
        }

    
    var body: some Scene {
        WindowGroup {
            ContentView()
            
        }
    }
}
