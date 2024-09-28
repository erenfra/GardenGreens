//
//  PreviewContainer.swift
//  GardenGreens
//
//  Created by Renato Oliveira Fraga on 9/27/24.
//
import SwiftData
import Foundation

@MainActor
let previewContainer: ModelContainer = {

  do {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try ModelContainer(for: Vegetable.self, configurations: config)
    SampleData.vegetables.forEach { vegetable in
      container.mainContext.insert(vegetable)
    }
    return container

  } catch {
    fatalError("Failed to create preview: \(error.localizedDescription)")
  }

}()


struct SampleData {
  static let vegetables: [Vegetable] = {
    return [Vegetable(name: "Onion"),
            Vegetable(name: "Carrots"),
            Vegetable(name: "Tomatos")]
  }()

}
