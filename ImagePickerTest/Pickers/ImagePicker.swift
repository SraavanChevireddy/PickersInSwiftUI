//
//  ImagePicker.swift
//  ImagePickerTest
//
//  Created by Sraavan Chevireddy on 7/28/20.
//  Copyright © 2020 Saven Developers Office. All rights reserved.
//

import SwiftUI

struct SDOImagePicker : UIViewControllerRepresentable{
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image:Image?
    
    /**
     * Create a Coordinator class that can use the delegate of ImagePickerController.
     */
    class Coordinator : NSObject,UINavigationControllerDelegate,UIImagePickerControllerDelegate{
        let context : SDOImagePicker
        public init(_ parent: SDOImagePicker){
            context = parent
        }
        
        // MARK: ImagePicker Controller Delegate methods
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            print("finished picking the image")
            let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            // Updating the image on the coordinators context.
            context.image = Image(uiImage: pickedImage)
            /**
             * Dismiss the presented card view here.
             */
            context.presentationMode.wrappedValue.dismiss()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            print("Din' pick an image from the Picker selector!")
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: ViewController Representable Delegate Methods.
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        print("doesnot have any use at the moment!")
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

}
