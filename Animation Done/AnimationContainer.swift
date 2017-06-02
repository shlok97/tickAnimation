//
//  AnimationContainer.swift
//  Animation Done
//
//  Created by Shlok Kapoor on 01/06/17.
//  Copyright © 2017 App Gali. All rights reserved.
//

import UIKit

class AnimationContainer: UIView {
    
    internal enum PositionOfRectangle: CGFloat {
        case vertcal = 34
        case horizontal = 88
    }
    
    func animateTickMark() {
        let tickView = UIView()
        var horizontalPart = setupAPart(position: .horizontal)
        var verticalPart = setupAPart(position: .vertcal)
        tickView.addSubview(horizontalPart)
        tickView.addSubview(verticalPart)
        
        self.addSubview(tickView)
        
        animation(view: &horizontalPart, position: .horizontal)
        animation(view: &verticalPart, position: .vertcal)
        
    }
    
    internal func animation(view: inout UIView, position: PositionOfRectangle) {
        let overlay = UIView()
        overlay.frame = bounds
        overlay.backgroundColor = UIColor.white
        view.addSubview(overlay)
        
        let width = position.rawValue
        var delay = 0.0
        
        switch position {
        case .horizontal:
            delay = 0.3
        case .vertcal:
            delay = 0.0
        }
        overlay.frame.origin.y += -1.0
        UIView.animateKeyframes(withDuration: 0.5, delay: delay, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1, animations: { 
                overlay.frame.origin.x += width+10
            })
        }, completion: { (error) in
            overlay.removeFromSuperview()
        })
    }
    
    internal func setupAPart(position: PositionOfRectangle) -> UIView {
        let color = UIColor.black
        // Create a CAShapeLayer
        let shapeLayer = CAShapeLayer()
        
        // The Bezier path that we made needs to be converted to
        // a CGPath before it can be used on a layer.
        shapeLayer.path = createRectangleWithRoundedEdges(color: color, position: position).cgPath
        
        // apply other properties related to the path
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.fillColor = color.cgColor
        shapeLayer.lineWidth = 1.0
        
        // add the new layer to our custom view
        let newView = UIView()
        newView.layer.addSublayer(shapeLayer)
        switch position {
        case .horizontal:
            newView.transform = CGAffineTransform(rotationAngle: -CGFloat.pi/4)
            newView.frame.origin.x = 25
            newView.frame.origin.y = 25
        case .vertcal:
            newView.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            newView.frame.origin.x = 15
            newView.frame.origin.y = 0
        }
        return newView
    }
    
    
    
    internal func createRectangleWithRoundedEdges(color: UIColor, position: PositionOfRectangle) -> UIBezierPath {
        
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: position.rawValue, height: 11), cornerRadius: 4)
        color.setFill()
        rectanglePath.fill()
        UIColor.black.setStroke()
        rectanglePath.lineWidth = 1
        rectanglePath.stroke()
        
        return rectanglePath
    }
}
