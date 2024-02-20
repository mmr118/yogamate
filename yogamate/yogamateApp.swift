//
//  yogamateApp.swift
//  yogamate
//
//  Created by Monica Rondón on 2/5/24.
//  


import SwiftUI
import SwiftData

@main
struct yogamateApp: App {

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Countdown.self,
        ])

        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)

    }
}
