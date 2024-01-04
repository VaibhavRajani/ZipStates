//
//  ContentView.swift
//  ZipStates
//
//  Created by Vaibhav Rajani on 1/4/24.
//

import SwiftUI

struct StatesView: View {
    @ObservedObject var stateManager: StateManager

    var body: some View {
        NavigationView {
            List(stateManager.states.keys.sorted(), id: \.self) { state in
                NavigationLink(destination: ZipCodesView(state: state, stateManager: stateManager)) {
                    Text(state)
                }
            }
            .navigationTitle("US States")
        }
    }
}

