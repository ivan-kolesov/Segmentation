//
//  SwiftUIViewController.swift
//  Segmentation
//
//  Created by Ivan on 18.08.2021.
//

import SwiftUI

struct SwiftUIViewController: UIViewControllerRepresentable {
    var targetObjectLabel: String
    // this is the binding that we receive from the SwiftUI side
    let identifier: Binding<String>
    
    // this will be the delegate of the view controller, it's role is to allow
    // the data transfer from UIKit to SwiftUI
    class Coordinator: ViewControllerDelegate {
        let identifierBinding: Binding<String>
        
        init(identifierBinding: Binding<String>) {
            self.identifierBinding = identifierBinding
        }
        
        func clasificationOccured(_ viewController: SegmentationController, identifier: String) {
            // whenever the view controller notifies it's delegate about receiving a new idenfifier
            // the line below will propagate the change up to SwiftUI
            identifierBinding.wrappedValue = identifier
        }
    }
    
    func makeUIViewController(context: Context) -> SegmentationController{
        let vc = UIStoryboard(name: "Segmentation", bundle: Bundle.main).instantiateViewController(withIdentifier: "SegmentationController") as! SegmentationController
        vc.targetObjectLabel = self.targetObjectLabel
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: SegmentationController, context: Context) {
        // update the controller data, if needed
    }
    
    // this is very important, this coordinator will be used in `makeUIViewController`
    func makeCoordinator() -> Coordinator {
        Coordinator(identifierBinding: identifier)
    }
}

protocol ViewControllerDelegate: AnyObject {
    func clasificationOccured(_ viewController: SegmentationController, identifier: String)
}
