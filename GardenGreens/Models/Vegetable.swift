//
//  Vegetable.swift
//  GardenGreens
//
//  Created by Renato Oliveira Fraga on 9/27/24.
//
import SwiftData
import Foundation

@Model
class Vegetable {
  var name: String = "tomato"
  @Relationship(deleteRule: .cascade) var notes: [Note]?

  init(name: String) {
    self.name = name
  }
}
