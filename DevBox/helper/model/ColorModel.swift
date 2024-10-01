//
//  ColorModel.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/27/24.
//

import Foundation

// Light Theme Model
struct Theme: Codable {
    let primary: String
    let onPrimary: String
    let primaryContainer: String
    let onPrimaryContainer: String
    let secondary: String
    let onSecondary: String
    let secondaryContainer: String
    let onSecondaryContainer: String
    let tertiary: String
    let onTertiary: String
    let tertiaryContainer: String
    let onTertiaryContainer: String
    let error: String
    let onError: String
    let errorContainer: String
    let onErrorContainer: String
    let background: String
    let onBackground: String
    let surface: String
    let onSurface: String
    let surfaceVariant: String
    let onSurfaceVariant: String
    let outline: String
    let outlineVariant: String
    let shadow: String
    let scrim: String
    let inverseSurface: String
    let inverseOnSurface: String
    let inversePrimary: String
    let surfaceDim: String
    let surfaceBright: String
    let surfaceContainerLowest: String
    let surfaceContainerLow: String
    let surfaceContainer: String
    let surfaceContainerHigh: String
    let surfaceContainerHighest: String
}

// API Response Model
struct ThemeResponse: Codable {
    let light: Theme
    let dark: Theme
}

struct DataResponse: Codable {
    let data: ThemeResponse
}
