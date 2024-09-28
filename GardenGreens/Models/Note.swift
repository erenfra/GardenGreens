//
//  Note.swift
//  GardenGreens
//
//  Created by Renato Oliveira Fraga on 9/27/24.
//
import SwiftData
import Foundation

@Model
class Note {
  var text: String
  var vegetable: Vegetable?

  init(text: String) {
    self.text = text
  }
}
