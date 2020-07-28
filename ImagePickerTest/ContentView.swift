//
//  ContentView.swift
//  ImagePickerTest
//
//  Created by Sraavan Chevireddy on 7/28/20.
//  Copyright © 2020 Saven Developers Office. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentedView : Bool = false
    @State var image : Image?
    var body: some View {
        VStack{
            if image == nil{
                Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(Color.purple)
                .clipShape(Circle())
                .padding(.bottom)
            }else{
                image!
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .padding(.bottom)
            }
            
            Button(action:{
                print("Tapped on profile picture button!")
                self.presentedView.toggle()
            }){
                Text("Choose Profile picture")
            }.sheet(isPresented: $presentedView, onDismiss: loadImage) {
                SDOImagePicker(image: self.$image)
            }
        }
    }
    
    func loadImage(){
        guard let _ = image else{return}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
