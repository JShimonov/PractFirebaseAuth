//
//  UIViewExtension.swift
//  PractiOS
//
//  Created by Joseph Shimonov on 6/26/19.
//  Copyright © 2019 Joseph Shimonov. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y:0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setFiveBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor, colorFour: UIColor, colorFive: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorFour.cgColor, colorFive.cgColor]
        //gradientLayer.locations = [0.0, 0.1, 0.4, 0.7,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.25, y:1.0) // 0.5, 1.0
        gradientLayer.endPoint = CGPoint(x:1.0, y:0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setFourBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor, colorFour: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor, colorFour.cgColor]
        //gradientLayer.locations = [0.0, 0.1, 0.4, 0.7,1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:1.0, y:0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setThreeBackground(colorOne: UIColor, colorTwo: UIColor, colorThree: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor, colorThree.cgColor]
        //gradientLayer.locations = [0.0, 0.1, 0.4, 0.7,1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y:1.0)
        gradientLayer.endPoint = CGPoint(x:0.0, y:0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}
