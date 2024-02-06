//
//  ContentView.swift
//  yogamate
//
//  Created by Monica Rondón on 2/5/24.
//  


import SwiftUI
import SwiftData

struct ContentView: View {

    @Environment(\.modelContext) private var modelContext

    var body: some View {

        TabView {
            
            Stopwatch()
                .tabItem {
                    Image(systemName: "stopwatch")
                }

            ItemList()
                .tabItem {
                    Image(systemName: "list.dash")
                }
                .environment(\.modelContext, modelContext)
        }
    }

}


// MARK: - Previews
#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
