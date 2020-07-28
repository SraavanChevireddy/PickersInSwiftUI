//
//  ContactPicker.swift
//  ImagePickerTest
//
//  Created by Sraavan Chevireddy on 7/28/20.
//  Copyright © 2020 Saven Developers Office. All rights reserved.
//

import SwiftUI
import ContactsUI

struct ContactsPicker : UIViewControllerRepresentable{
    
    @Environment(\.presentationMode) var presentationMode
    
    class ContactsCoordinator : NSObject,UINavigationControllerDelegate,CNContactPickerDelegate{
        let contactsCoordinator : ContactsPicker
        public init(_ parent: ContactsPicker){
            contactsCoordinator = parent
        }
        // MARK: Contacts Delegate methods
        func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
            print("Contact picked cancelled!")
        }
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            print("Selected a contact")
        }
    }
    
    // MARK: ViewController Representable delegate methods
    func makeCoordinator() -> ContactsCoordinator {
        return ContactsCoordinator(self)
    }
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let contactsController = CNContactPickerViewController()
        contactsController.delegate = context.coordinator
        return contactsController
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {
        print("Updating the contacts controller!")
    }
}
