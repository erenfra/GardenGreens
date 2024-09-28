//
//  ContentView.swift
//  GardenGreens
//
//  Created by Renato Oliveira Fraga on 9/27/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query(sort: \Vegetable.name) var vegetables: [Vegetable]
  @State private var name: String = ""

  var body: some View {
    NavigationStack {
      ZStack {
        Color.mint.edgesIgnoringSafeArea(.all)
        VStack(alignment: .trailing) {
          TextField("Name", text: $name)
            .textFieldStyle(.roundedBorder)
            .onSubmit {
              guard name.isEmpty == false else { return }
              let vegetable = Vegetable(name: name)
              modelContext.insert(vegetable)
              name = ""
            }
          List {
            Section("List") {
              ForEach(vegetables) { vegetable in
                NavigationLink {
                  NoteListView(vegetable: vegetable)
                } label: {
                  Text(vegetable.name)
                    .padding(10)
                }


              }.onDelete(perform: removeVegetable)
                .listRowBackground(
                  Capsule()
                    .fill(Color.white.opacity(0.5))
                    .padding(.vertical, 5)
                )
                .listRowSeparator(.hidden)
            }
          }.scrollContentBackground(.hidden)
            .background(Color.mint.edgesIgnoringSafeArea(.all))
          Spacer()
        }
        .padding()
        .navigationTitle("Garden Greens")
      }
    }
  }

  func removeVegetable(at offsets: IndexSet) {
    for offset in offsets {
      let product = vegetables[offset]
      modelContext.delete(product)
    }

  }
}

#Preview { @MainActor in
  NavigationStack {
    ContentView()
      .modelContainer(previewContainer)
  }
}
