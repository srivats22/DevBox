//
//  ColorViewModel.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/27/24.
//

import Foundation

@MainActor
class ThemeViewModel: ObservableObject {
    @Published var lightTheme: Theme?
    @Published var darkTheme: Theme?
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isRespVisible = false
    
    func fetchThemes(color: String) async {
        isLoading = true
        let buildColor = color.hasPrefix("#") ? color.replacingOccurrences(of: "#", with: "%23") : "%23" + color
        let urlString = "https://dynamic-color-backend.vercel.app/color?baseColor=\(buildColor)&lang=nodejs"
        debugPrint("Req url: \(urlString)")
        guard let url = URL(string: urlString) else {
            self.errorMessage = "Invalid URL"
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let themeResponse = try JSONDecoder().decode(DataResponse.self, from: data)
            
            self.lightTheme = themeResponse.data.light
            self.darkTheme = themeResponse.data.dark
            self.isLoading = false
            self.isRespVisible = true
            
        } catch {
            self.errorMessage = "Failed to fetch themes: \(error.localizedDescription)"
            self.isLoading = false
            self.isRespVisible = true
        }
    }
    
    func reset(){
        lightTheme = nil
        darkTheme = nil
        isLoading = false
        errorMessage = nil
        isRespVisible = false
    }
}
