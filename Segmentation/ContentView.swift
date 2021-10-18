//
//  ContentView.swift
//  Segmentation
//
//  Created by Ivan on 16.08.2021.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    @State var clasificationIdentifier: String = ""
    @State var isActiveDamage = false
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: DetectCar(isPresented: self.$isActive), isActive: self.$isActive) {
                    Button(action: {
                        self.isActive = true
                    }) {
                        Text("Start")
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                }.isDetailLink(false)
                
                NavigationLink(destination: SelectDamage(part: "Test part", isPresented: self.$isActiveDamage), isActive: self.$isActiveDamage) {
                    Button(action: {
                        self.isActiveDamage = true
                    }) {
                        Text("Damage")
                    }
                    .buttonStyle(RoundedRectangleButtonStyle())
                }.isDetailLink(false)
            }
        }
    }
}
