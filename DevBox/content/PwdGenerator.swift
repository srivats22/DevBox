//
//  PwdGenerator.swift
//  DevBox
//
//  Created by srivats venkataraman on 9/28/24.
//

import SwiftUI

struct PwdGenerator: View {
    let lowerCaseLetter = "abcdefghijklmnopqrstuvwxyz"
    let upperCaseLetter = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let nums = "1234567890"
    let specialCharacters = "!@#$%^&*()_+-="
    
    @State private var password: String = ""
    @State private var passwordLength: Int = 8
    @State private var showErrorMsg: Bool = false
    
    // Function to generate the password
    func generatePwd(length: Int) -> String {
        var charSet = ""
        charSet.append(contentsOf: lowerCaseLetter)
        charSet.append(contentsOf: upperCaseLetter)
        charSet.append(contentsOf: nums)
        charSet.append(contentsOf: specialCharacters)
        
        // Generate the password by selecting random elements
        return String((0..<length).compactMap { _ in charSet.randomElement() })
    }
    
    var body: some View {
        VStack(spacing: 5) {
            VStack{
                HStack(alignment: .center){
                    Button(action: {
                        passwordLength -= 1
                    })
                    {
                        Image(systemName: "minus")
                    }
                    .disabled(passwordLength == 1)
                    TextField("Password Length", text: Binding(
                        get: { String(passwordLength) }, // Convert Int to String for TextField
                        set: { newValue in
                            if let newInt = Int(newValue) {
                                passwordLength = newInt
                            }
                        }
                    ))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        passwordLength += 1
                    }){
                        Image(systemName: "plus")
                    }
                }
                Button(action: {
                    password = generatePwd(
                        length: passwordLength
                    )
                }){
                    Text("Generate")
                }
            }
            .padding(10)
            if !password.isEmpty {
                HStack{
                    CodeView(isHorizontalScroll: true , content: password)
                }
            }
        }
        .padding()
    }
}
