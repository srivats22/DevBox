//
//  UuidGenerator.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/28/24.
//

import SwiftUI

struct UuidGeneratorView: View{
    @State private var numOfUUIds = 5
    
    var body: some View {
        ScrollView(.vertical){
            VStack{
                HStack(alignment: .center){
                    Button(action: {
                        numOfUUIds -= 1
                    })
                    {
                        Image(systemName: "minus")
                    }
                    .disabled(numOfUUIds == 1)
                    TextField("Enter Hex Code", text: Binding(
                        get: { String(numOfUUIds) }, // Convert Int to String for TextField
                        set: { newValue in
                            // Try to convert the new value back to Int
                            if let newInt = Int(newValue) {
                                numOfUUIds = newInt
                            }
                        }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        numOfUUIds += 1
                    }){
                        Image(systemName: "plus")
                    }
                }
                Button(action: {}){
                    Text("Generate")
                }
            }
            .padding(10)
            VStack {
                ForEach(1...numOfUUIds, id: \.self) { index in
                    let uuid = UUID().uuidString
                    HStack{
                        CodeView(isHorizontalScroll: true, content: uuid)
//                        ScrollView(.horizontal){
//                            Text(uuid)
//                                .font(.system(.body, design: .monospaced)) // Monospaced font
//                                .padding()
//                                .background(Color.gray.opacity(0.1)) // Light gray background for code block effect
//                                .cornerRadius(8)
//                        }
//                        Button(
//                            action: {
//                                NSPasteboard.general.clearContents()
//                                NSPasteboard.general.setString(uuid, forType: .string)
//                            }
//                        )
//                        {
//                            Image(systemName: "doc.on.doc")
//                        }
                    }
                }
            }
        }
    }
}
