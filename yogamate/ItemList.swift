//
//  ItemList.swift
//  yogamate
//
//  Created by Monica Rondón on 2/6/24.
//  


import SwiftUI
import SwiftData

struct ItemList: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Countdown]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button {
                        showTimerCreation.toggle()
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
        .popover(isPresented: $showTimerCreation) {



        }
    }

    @State var showTimerCreation = false

    private func addItem() {
        withAnimation {
            // let newItem = Countdown(timestamp: Date())
            let newItem = Countdown(duration: .zero)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}


// MARK: - Previews
#Preview {
    ItemList()
        .modelContainer(for: Countdown.self, inMemory: true)

}
