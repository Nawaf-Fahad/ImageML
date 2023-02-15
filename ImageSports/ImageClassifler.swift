//
//  ImageClassifler.swift
//  ImageSports
//
//  Created by Nawaf Alotaibi on 15/02/2023.
//

import SwiftUI

class ImageClassifler: ObservableObject{
    @Published private var classifler = Classifier()
    
    var imageClass: String?{
        classifler.results
    }
    func detect(uiImage: UIImage){
        guard let ciImage = CIImage(image: uiImage) else { return }
        classifler.detect(ciImage: ciImage)
    }
}
