//
//  SelectDamage.swift
//  Segmentation
//
//  Created by Ivan on 18.08.2021.
//

import SwiftUI

struct SelectDamage: View {
    var part: String
    @Binding var isPresented: Bool
    
    @State var types = FieldValue(value: "", label: "Type", items: ["Type 1", "Type 2", "Type 3"])
    @State var severity = FieldValue(value: "", label: "Severity", items: ["Severity 1", "Severity 2", "Severity 3"])
    
    @State var showImagePicker: Bool = false
    @State var image: UIImage?
    
    var body: some View {
        Form {
            Text(self.part)
                .font(.headline)
                .padding()
            
            SelectField(fieldValue: self.$types)
            SelectField(fieldValue: self.$severity)
            
            VStack {
                if image != nil {
                    Image(uiImage: image!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Button("Pick image") {
                    self.showImagePicker.toggle()
                }
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePickerView(sourceType: .camera) { image in
                    self.image = image
                }
            }
            
            Spacer()
            
            Button(action: {
                self.isPresented = false
            }) {
                Text("Save")
            }
            .buttonStyle(RoundedRectangleButtonStyle())
        }
        .navigationBarTitle("Fillin damage form", displayMode: .inline)
    }
}
