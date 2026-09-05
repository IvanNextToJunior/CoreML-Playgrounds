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
        let requests = [detectionRequest]
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            do {
                try imageRequestHandler.perform(requests)
            }
            catch {
                print(error.localizedDescription)
            }
            
        }
    }
    var detectionRequest: VNDetectRectanglesRequest {
        let request = VNDetectRectanglesRequest() {request, error in
           
            if let detectError = error {
               
                print(detectError)
               
                return
            }
            else {
              
                guard let observations = request.results as? [VNDetectedObjectObservation] else {return}
              
                print(observations)
            }
        }
        return request
    }
}
