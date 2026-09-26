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
            UIGraphicsBeginImageContextWithOptions(imageSize, true, 0.0)
            let context = UIGraphicsGetCurrentContext()
            image.draw(in: CGRect(origin: .zero, size: imageSize))
            context?.saveGState()
            context?.setLineWidth(8)
            context?.setLineJoin(CGLineJoin.round)
            context?.setStrokeColor(UIColor.red.cgColor)
            context?.setFillColor(red: 1, green: 0, blue: 0, alpha: 0.3)
            
            for observation in observations {
                
                let observationBounds = observation.boundingBox.applying(transform)
                context?.addRect(observationBounds)
            }
            
            context?.drawPath(using: .fillStroke)
            context?.restoreGState()
            
            let drawnImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.imageView.image = drawnImage
            
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
                self.visualizeObservations(observations)
            }
            
        }
       
        request.maximumObservations = 0
        request.minimumConfidence = 0.5
        request.minimumAspectRatio = 0.4
        
        return request
    }
}
