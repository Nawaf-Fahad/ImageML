//
//  ImageSportsApp.swift
//  ImageSports
//
//  Created by Nawaf Alotaibi on 13/02/2023.
//

import SwiftUI

@main
struct ImageSportsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(classifler: ImageClassifler())
        }
    }
}
