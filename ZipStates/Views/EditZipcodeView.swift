//
//  EditZipcodeView.swift
//  ZipStates
//
//  Created by Vaibhav Rajani on 1/4/24.
//

import SwiftUI

struct EditZipCodeView: View {
    var selectedZipCode: String
    var stateName: String
    @ObservedObject var stateManager: StateManager
    @State private var newZipCode: String
    @Environment(\.presentationMode) var presentationMode
    
    init(selectedZipCode: String, stateName: String, stateManager: StateManager) {
        self.selectedZipCode = selectedZipCode
        self.stateName = stateName
        self.stateManager = stateManager
        self._newZipCode = State(initialValue: "")
    }
    
    var body: some View {
        VStack {
            Text("Edit Zip Code")
                .font(.title)
                .padding()

            Text("Current Zip Code: \(selectedZipCode)")
                .font(.body)
                .padding()

            TextField("Enter new zipcode", text: $newZipCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                if let index = stateManager.states[stateName]?.firstIndex(of: selectedZipCode) {
                    stateManager.states[stateName]?[index] = newZipCode
                }
                stateManager.saveStates()
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("OK")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationBarTitle("Edit Zip Code", displayMode: .inline)
    }
}
