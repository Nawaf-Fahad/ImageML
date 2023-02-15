//
//  ContentView.swift
//  ImageSports
//
//  Created by Nawaf Alotaibi on 13/02/2023.
//

import SwiftUI
struct ContentView: View {
    
    enum SheetToShow: Int, Identifiable {
            case photoLibrary
            case camera

            var id: Int { self.rawValue }
        }
    @State private var selectedImage: UIImage?
    @State private var sheetToShow: SheetToShow? = nil

    @ObservedObject var classifler : ImageClassifler
    var body: some View {
            VStack{
                HStack{
                    Button {
                    #if targetEnvironment(simulator)
                        sheetToShow = .photoLibrary;

                    #else
                        sheetToShow = .camera;
                    #endif

                    }
                label: {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24,height: 24)
                        .foregroundColor(.accentColor)

                    
                }
                    Spacer(minLength: 0)
                    Text("Scary hours")
                        .font(.callout)
                    Spacer(minLength: 0)

                    Button {
                        sheetToShow = .photoLibrary
                    } label: {
                        Image(systemName: "photo.on.rectangle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24,height: 24)
                            .foregroundColor(.accentColor)
                    }
                }
                .padding()
                Spacer(minLength: 0)
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFill()
                        .frame(width: 200, height: 400)
                        .padding(10)
                    
                } else{
                    Image("Ghost")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaledToFit()
                        .frame(width: 250, height: 450)
                        .padding()
                }
                
                Button {
                    if selectedImage != nil{
                        classifler.detect(uiImage: selectedImage!)
                    }
                    
                } label: {
                    Image(systemName: "bolt.fill")
                        
                }
                Group{
                    if let imageClass = classifler.imageClass{
                        HStack{
                            Text("Image is")
                                .font(.caption)
                            Text(imageClass)
                                .bold()
                        }
                    }
                    else{
                        HStack{
                            
                        }
                    }
                }
                .font(.subheadline)
                .padding()

                Spacer(minLength: 0)
                
                
            }
            .sheet(item: $sheetToShow) { item in
                switch item {
                case .photoLibrary:
                    ImagePickerView(selectedImage: $selectedImage, sourceType: .photoLibrary)

                case .camera:
                    ImagePickerView(selectedImage: $selectedImage, sourceType: .camera)
                }
        }
    }
}
