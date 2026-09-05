//
//  ViewController+Vision.swift
//  PhotoAnalyzer
//
//  Created by Галина Маслова on 03.09.2026.
//

import Vision
import UIKit

extension ViewController {
  
    func performVisionRequest(image: UIImage) {
       
        guard let newImage =  image.cgImage else {return}
        let imageRequestHandler = VNImageRequestHandler(cgImage: newImage, orientation: image.cgOrientation, options: [:])
        
    }
}
