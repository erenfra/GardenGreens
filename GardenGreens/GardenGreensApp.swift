//
//  GardenGreensApp.swift
//  GardenGreens
//
//  Created by Renato Oliveira Fraga on 9/27/24.
//
import SwiftData
import SwiftUI

@main
struct GardenGreensApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Vegetable.self)
    }
}
