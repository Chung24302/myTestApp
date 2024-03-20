//
//  hwSubmitConfrom.swift
//  myAssistant
//
//  Created by Chung on 2024/3/18.
//
import Foundation
import SwiftUI

struct hwSubmitConfrom: View {
    @State private var showSheet = false
    var body: some View {
        VStack {
                   Button("Show Bottom Sheet") {
                       showSheet.toggle()
                   }
                   .buttonStyle(.borderedProminent)
                   .sheet(isPresented: $showSheet) {
                       Text( "\(ballStatuses[1] ?? "No data")")
                   }
        
                   Spacer()
               }
        
    }
}

#Preview {
    hwSubmitConfrom()
}
