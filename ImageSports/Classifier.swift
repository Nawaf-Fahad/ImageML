//
//  Classifier.swift
//  ImageSports
//
//  Created by Nawaf Alotaibi on 15/02/2023.
//

import CoreML
import Vision
import CoreImage

struct Classifier{
    private(set) var results : String?
    
    mutating func detect(ciImage: CIImage){
        guard let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MLModelConfiguration()).model) else{return}
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage,options: [:])
        
        try? handler.perform([request])
        
        guard let result = request.results as? [VNClassificationObservation] else {return}
        
        if let firstResult = result.first{self.results = firstResult.identifier}
    }
}
