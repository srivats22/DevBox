//
//  DetailView.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/25/24.
//
import SwiftUI

enum DetailViewType {
    case colorPalette
    case personGenerator
    case pwdGenerator
    case uuidGenerator
    case appDets
    // Add more cases as needed
}

struct DetailView: View {
    let viewType: DetailViewType
    
    var body: some View {
        VStack {
            switch viewType {
                case .colorPalette:
                    ColorPaletteView()
                case .personGenerator:
                    PersonGeneratorView()
                case .pwdGenerator:
                    PwdGenerator()
                case .uuidGenerator:
                    UuidGeneratorView()
                case .appDets:
                    AppDetails()
            }
        }
        .frame(width: 300, height: 400)
    }
}
