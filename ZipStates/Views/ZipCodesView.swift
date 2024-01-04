//
//  ZipCodesView.swift
//  ZipStates
//
//  Created by Vaibhav Rajani on 1/4/24.
//

import SwiftUI

struct ZipCodesView: View {
    var state: String
    @ObservedObject var stateManager: StateManager
    
    var body: some View {
        List(stateManager.states[state] ?? [], id: \.self) { zipCode in
            NavigationLink(destination: EditZipCodeView(selectedZipCode: zipCode, stateName: state, stateManager: stateManager)) {
                Text(zipCode)
            }
        }
        .navigationBarTitle("\(state)")
    }
}
