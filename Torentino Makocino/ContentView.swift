//
//  ContentView.swift
//  Torentino Makocino
//
//  Created by Denis Yazan on 26.07.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                NavigationLink(destination: AllTorrentsView()) {
                    Label("All Torrents", systemImage: "cloud.fill")
                }
                NavigationLink(destination: AllTorrentsView()) {
                    Label("Downloading...", systemImage: "arrow.down.circle.fill")
                }
                NavigationLink(destination: AllTorrentsView()) {
                    Label("Completed", systemImage: "checkmark.rectangle.stack.fill")
                }
            }
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
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

struct AllTorrentsView: View {
    var body: some View {
        Text("All Torrents Page.")
    }
}

struct DownloadingTorrentsView: View {
    var body: some View {
        Text("Downloading page.")
    }
}

struct CompletedTorrentsView: View {
    var body: some View {
        Text("Completed torrents.")
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
