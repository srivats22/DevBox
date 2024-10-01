//
//  ColorPalette.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/27/24.
//

import SwiftUI

struct ColorPaletteView: View {
    @State private var selectedThemeIndex = 0
    @StateObject var themeViewModel = ThemeViewModel()
    @State private var codeToCopy: String = ""
    @State private var showCopiedMessage = false
    @State private var colorString = ""
    @State private var isColorVisible = false
    let hexRegex = "#([A-Fa-f0-9]{6}"
    
    var body: some View {
        ScrollView(.vertical){
            HStack(alignment: .center) {
                TextField("Enter Hex Code", text: $colorString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(themeViewModel.isRespVisible)
                    .onSubmit {
                        callDynamicColor(color: "\(colorString)")
                    }
                Button(action: {
                    if themeViewModel.isRespVisible{
                        themeViewModel.isRespVisible.toggle()
                        themeViewModel.darkTheme = nil
                        themeViewModel.lightTheme = nil
                    }
                    else{
                        callDynamicColor(color: "\(colorString)")
                    }
                }) {
                    themeViewModel.isRespVisible ? Text("Reset") : Text("Send")
                }
            }
            .frame(maxHeight: .infinity, alignment: .center)
            .padding(5)
            VStack(alignment: .leading) {
                if themeViewModel.isLoading {
                    ProgressView()
                }
                if themeViewModel.isRespVisible {
                    Picker("", selection: $selectedThemeIndex) {
                        Text("Light").tag(0)
                        Text("Dark").tag(1)
                    }
                    .pickerStyle(.segmented)
                    if selectedThemeIndex == 0 {
                        if let lightTheme = themeViewModel.lightTheme {
                            Text("Light Theme JSON:")
                                .font(.headline)
                            CodeView(isHorizontalScroll: false, content: lightThemeJsonString(from: lightTheme))
                        }
                    }
                    if selectedThemeIndex == 1 {
                        if let darkTheme = themeViewModel.darkTheme {
                            Text("Dark Theme JSON:")
                                .font(.headline)
                            CodeView(isHorizontalScroll: false, content: darkThemeJsonString(from: darkTheme))
                        }
                    }
                }
                if let errorMessage = themeViewModel.errorMessage {
                    Text("Error: \(errorMessage)")
                        .foregroundColor(.red)
                }
            }
            .padding()
        }
    }
    
    func callDynamicColor(color: String){
        debugPrint("Color: \(color)")
        Task{
            themeViewModel.isRespVisible.toggle()
            await themeViewModel.fetchThemes(color: color)
            isColorVisible.toggle()
        }
    }
    
    // Helper function to convert the light theme to a JSON string
    func lightThemeJsonString(from theme: Theme) -> String {
        let jsonData = try? JSONEncoder().encode(theme)
        return String(data: jsonData!, encoding: .utf8) ?? ""
    }
    
    // Helper function to convert the dark theme to a JSON string
    func darkThemeJsonString(from theme: Theme) -> String {
        let jsonData = try? JSONEncoder().encode(theme)
        return String(data: jsonData!, encoding: .utf8) ?? ""
    }
}
