//
//  DataLoader.swift
//  ZipStates
//
//  Created by Vaibhav Rajani on 1/4/24.
//

import Foundation

class StateManager: ObservableObject {
    @Published var states: [String: [String]] = [:]

    init() {
        loadStates()
    }

    func loadStates() {
        states = {
            let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("statedictionary.plist")
            let bundlePath = Bundle.main.url(forResource: "States", withExtension: "plist")

            let path = FileManager.default.fileExists(atPath: documentsPath.path) ? documentsPath : bundlePath

            guard let url = path, let data = try? Data(contentsOf: url) else {
                return [:]
            }
            print("Data Loaded")

            let decoder = PropertyListDecoder()
            return (try? decoder.decode([String: [String]].self, from: data)) ?? [:]
        }()

    }

    func saveStates() {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("statedictionary.plist")

        do {
            let data = try encoder.encode(states)
            try data.write(to: path)
            print("Data saved")
        } catch {
            print(error)
        }
    }
}


func copyPlistToDocuments() {
    let documentsPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("statedictionary.plist")
    guard !FileManager.default.fileExists(atPath: documentsPath.path) else { return }

    if let bundlePath = Bundle.main.url(forResource: "statedictionary", withExtension: "plist") {
        do {
            try FileManager.default.copyItem(at: bundlePath, to: documentsPath)
        } catch {
            print(error)
        }
    }
}

