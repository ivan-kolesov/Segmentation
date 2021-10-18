//
//  DetectCar.swift
//  Segmentation
//
//  Created by Ivan on 18.08.2021.
//

import SwiftUI

struct DetectCar: View {
    @Binding var isPresented: Bool
    @State var clasificationIdentifier: String = ""
    @State var isActive = false
    
    var body: some View {
        Group {
            NavigationLink(destination: DetectPart(isPresented: self.$isPresented), isActive: self.$isActive) {
                EmptyView()
            }.isDetailLink(false)
            
            ZStack (alignment: .bottom) {
                SwiftUIViewController(targetObjectLabel: "car", identifier: $clasificationIdentifier)
                
                if !clasificationIdentifier.isEmpty {
                    Button(action: {
                        self.isActive = true
                    }) {
                        Text("Detected: \(clasificationIdentifier)")
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                }
            }
        }
        .navigationBarTitle("Detect a car", displayMode: .inline)
    }
}
