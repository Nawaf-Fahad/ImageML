//
//  Coordinator.swift
//  ImageSports
//
//  Created by Nawaf Alotaibi on 14/02/2023.
//

import UIKit

final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var parent: ImagePickerView

    init(_ parent: ImagePickerView) {
        self.parent = parent
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parent.selectedImage = image
        }

        parent.isPresented.wrappedValue.dismiss()
    }
}
