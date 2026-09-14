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
    
    private func visualizeObservations(_ observations: [VNDetectedObjectObservation]) {
        DispatchQueue.main.async {
            
            guard let image = self.imageView.image else {
                print("Failed to retrieve image!")
                return
            }
            let imageSize = image.size
            var transform = CGAffineTransform.identity.scaledBy(x: 1, y: -1).translatedBy(x: 0, y: -imageSize.height)
            transform = transform.scaledBy(x: imageSize.width, y: imageSize.height)
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
