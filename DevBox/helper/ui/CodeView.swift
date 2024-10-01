//
//  CodeView.swift
//  DevBox
//
//  Created by srivats venkataraman on 10/1/24.
//

import SwiftUI

struct CodeView: View {
    let isHorizontalScroll: Bool
    let content: String
    
    var body: some View {
        if isHorizontalScroll {
            ScrollView(.horizontal){
                Text(content)
                    .font(.system(.body, design: .monospaced)) // Monospaced font
                    .padding()
                    .background(Color.gray.opacity(0.1)) // Light gray background for code block effect
                    .cornerRadius(8)
            }
            Button(
                action: {
                    NSPasteboard.general.clearContents()
                    NSPasteboard.general.setString(content, forType: .string)
                }
            )
            {
                Image(systemName: "doc.on.doc")
            }
        }
        else{
            ScrollView(.vertical) {
                Text(content)
                    .font(.system(.body, design: .monospaced)) // Monospaced font
                    .padding()
                    .background(Color.gray.opacity(0.1)) // Light gray background for code block effect
                    .cornerRadius(8)
            }
        }
    }
}
