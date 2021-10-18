//
//  SelectField.swift
//  Segmentation
//
//  Created by Ivan on 18.08.2021.
//

import SwiftUI

struct FieldValue {
    var value: String
    var label: String
    var items: [String]
}

struct SelectField: View {
    @Binding var fieldValue: FieldValue
    @State private var value: String = ""
    
    var body: some View {
        Picker (selection: self.$fieldValue.value, label: Text(self.fieldValue.label).font(.headline)) {
            ForEach(self.fieldValue.items, id:\.self) { item in
                Text(item)
                    .font(.body)
            }
        }
        .font(.headline)
    }
}
