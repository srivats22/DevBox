//
//  PersonGenerator.swift
//  DevBox
//
//  Created by srivats venkataraman on 10/1/24.
//

import SwiftUI

struct PersonGeneratorView: View{
    var letters = "abcdefghijklmnopqrstuvwxyz"
    var emailDomains = ["gmail.com", "yahoo.com", "hotmail.com", "outlook.com"]
    @State private var userObj = "{}"
    
    @State private var fName = ""
    @State private var lName = ""
    @State private var email = ""
    
    func generateRandomUser(){
        fName = String((0..<7).compactMap { _ in letters.randomElement() })
        lName = String((0..<7).compactMap { _ in letters.randomElement() })
        email = fName + lName + "@" + emailDomains.randomElement()!
        let jsonObject: [String: String] = [
            "firstName": fName,
            "lastName": lName,
            "email": email
        ]
        if let jsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted),
           let jsonString = String(data: jsonData, encoding: .utf8) {
            userObj = jsonString
        }
    }
    
    var body: some View{
        VStack{
//            Text("First Name: \(fName)")
//            Text("Last Name: \(lName)")
//            Text("Email: \(email)")
            HStack{
                Text("Person")
                    .font(.system(size: 16, weight: .bold))
                Button(
                    action: {
                        NSPasteboard.general.clearContents()
                        NSPasteboard.general.setString(userObj, forType: .string)
                    }
                )
                {
                    Image(systemName: "doc.on.doc")
                }
            }
            CodeView(isHorizontalScroll: false, content: userObj)
        }
        .padding(15)
        .onAppear {
            generateRandomUser()
        }
    }
}
