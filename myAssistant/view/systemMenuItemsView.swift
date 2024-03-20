//
//  systemMenuItemsView.swift
//  myAssistant
//
//  Created by 蔡忠良 on 2024/3/2.
//

import SwiftUI

struct ClassAndStudentManager: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}
struct OutputFiles: View {
    var body: some View {
        Text("Hello, World!")
    }
}
struct logOut: View {
    var body: some View {
        Button(action: {
            print("Hello World tapped!")
        }){
            Text("Hello World tapped!")
        }
    }
}
