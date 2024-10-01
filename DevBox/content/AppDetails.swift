//
//  AppDetails.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/27/24.
//

import SwiftUI
import AppKit

struct AppDetails: View {
    
    func openWebsite(urlString: String) {
        if let url = URL(string: urlString) {
            NSWorkspace.shared.open(url)
        }
    }
    
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .leading, spacing: 16) {
                Text("About DevBox")
                    .font(.title)
                    .fontWeight(.bold)
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("DevBox is an Experimental App Developed By Srivats Venkataraman.")
                    Text("The idea behind DevBox is to provide access to dev tools that might be used on a regular basis such as UUID Generator, Random User Generator, Password Generator etc.")
                    Text("The Project is currently available only on MacOS as a menu bar app.")
                    Text("The Project is also open sourced and you can see the code on Github.")
                }
                .font(.subheadline)
            }
            .padding()
            .cornerRadius(10)
            .shadow(radius: 5)
            Button(
                action: {
                    openWebsite(urlString: "https://www.apple.com")
                }
            ){
                Text("View Code")
            }
        }
    }
}
