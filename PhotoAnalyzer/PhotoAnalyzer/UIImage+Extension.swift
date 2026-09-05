//
//  UIImage+Extension.swift
//  PhotoAnalyzer
//
//  Created by Галина Маслова on 04.09.2026.
//

import UIKit
extension UIImage {
    var cgOrientation: CGImagePropertyOrientation {
        switch imageOrientation {
            
        case .up:
            return .up
        case .down:
            return .down
        case .left:
            return .left
        case .right:
            return .right
        case .upMirrored:
            return .upMirrored
        case .downMirrored:
            return .downMirrored
        case .leftMirrored:
            return .leftMirrored
        case .rightMirrored:
            return .rightMirrored
        
        }
    }
}
