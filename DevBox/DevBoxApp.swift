//
//  DevBoxApp.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/25/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        List {
            NavigationLink{
                DetailView(viewType: .colorPalette)
            } label: {
                NavigationLinkLabel(title: "Color Palette", description: "Generate An M3 Based Color Pallet For NodeJS")
            }
            NavigationLink{
                DetailView(viewType: .personGenerator)
            } label: {
                NavigationLinkLabel(title: "Person Generator", description: "Generates A Random Person")
            }
            NavigationLink{
                DetailView(viewType: .pwdGenerator)
            } label: {
                NavigationLinkLabel(title: "Password Generator", description: "Generate A Unique Password")
            }
            NavigationLink{
                DetailView(viewType: .uuidGenerator)
            } label: {
                NavigationLinkLabel(title: "UUID Generator", description: "Generates Random UUIDs")
            }
            NavigationLink("App Details") {
                DetailView(viewType: .appDets)
            }
        }
        .navigationTitle("DevBox")
        .listStyle(.automatic)
        .frame(height: 200)
    }
}

struct NavigationLinkLabel: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}

@main
struct DevBoxApp: App {
    @State private var currNum: String = "1"

    var body: some Scene {
        MenuBarExtra {
            NavigationStack {
                MainView()
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("q")
        }label: {
            Text("DB")
                .frame(width: 18, height: 18)
        }
        .menuBarExtraStyle(.window)
    }
}
