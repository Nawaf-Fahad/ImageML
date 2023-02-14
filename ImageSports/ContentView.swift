//
//  ContentView.swift
//  ImageSports
//
//  Created by Nawaf Alotaibi on 13/02/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    var body: some View {
        
            VStack{
                HStack{
                    Button {
                        self.sourceType = .camera
                        
                        self.isImagePickerDisplay.toggle()

                       
                        
                    }label: {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                    
                }
                    Spacer(minLength: 0)
                    Text("Scary hours")
                        .font(.caption)
                    Spacer(minLength: 0)

                    Button {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                        
                    } label: {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24,height: 24)
                        
                    }
                    
                }
                .padding()
                
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 450)
                    
                } else{
                    Image("Ghost")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350, height: 450)
                }
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $isImagePickerDisplay) {
            ImagePickerView(selectedImage: $selectedImage, sourceType: self.sourceType)
        }
    }
}

