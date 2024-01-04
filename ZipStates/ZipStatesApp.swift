//
//  ZipStatesApp.swift
//  ZipStates
//
//  Created by Vaibhav Rajani on 1/4/24.
//

import SwiftUI

@main
struct ZipStatesApp: App {
    @StateObject private var stateManager = StateManager()

    init() {
        copyPlistToDocuments()
    }
    
    var body: some Scene {
        WindowGroup {
            StatesView(stateManager: stateManager)
        }
    }
}
