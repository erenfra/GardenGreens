//
//  NoteListView.swift
//  GardenGreens
//
//  Created by Renato Oliveira Fraga on 9/27/24.
//
import SwiftData
import SwiftUI

struct NoteListView: View {
  @Environment(\.modelContext) private var modelContext
  @State private var text: String = ""

  let vegetable: Vegetable

    var body: some View {
      ZStack {
        Color.mint.edgesIgnoringSafeArea(.all)
        VStack {
          TextField("Note text", text: $text)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
              guard text.isEmpty == false else { return }
              let note = Note(text: text)
              vegetable.notes?.append(note)
              text = ""
            }
          List {
            ForEach(vegetable.notes ?? []) { note in
              Text(note.text)
            }
          }.scrollContentBackground(.hidden)
            .background(Color.mint.edgesIgnoringSafeArea(.all))
          Spacer()
        }.padding()
          .navigationTitle(vegetable.name)
      }
    }
}

struct NoteListContainerScreen: View {
  @Query private var vegetables: [Vegetable]
  var body: some View {
    NoteListView(vegetable: vegetables[0])
  }
}
#Preview { @MainActor in
  NavigationStack {
    NoteListContainerScreen()
      .modelContainer(previewContainer)
  }
}
