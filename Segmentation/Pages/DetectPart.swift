//
//  DetectPart.swift
//  Segmentation
//
//  Created by Ivan on 18.08.2021.
//

import SwiftUI

struct DetectPart: View {
    @Binding var isPresented: Bool
    @State var clasificationIdentifier: String = ""
    @State var isActive = false
    
    var body: some View {
        Group {
            NavigationLink(destination: SelectDamage(part: self.clasificationIdentifier, isPresented: self.$isPresented), isActive: self.$isActive) {
                EmptyView()
            }.isDetailLink(false)
            
            ZStack (alignment: .bottom) {
                SwiftUIViewController(targetObjectLabel: "person", identifier: $clasificationIdentifier)
                if !clasificationIdentifier.isEmpty {
                    Button(action: {
                        self.isActive = true
                    }) {
                        Text("Detected part: \(clasificationIdentifier)")
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                }
            }
        }
        .navigationBarTitle("Detect a part", displayMode: .inline)
    }
}
