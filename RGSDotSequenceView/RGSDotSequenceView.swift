//
//  RGSDotSequenceView.swift
//  AnimteCircleSwift
//
//  Created by Randel Smith on 7/23/16.
//  Copyright © 2016 Randel Smith rs@randelsmith.com. All rights reserved.
//

import UIKit

public class RGSDotSequenceView: UIView {

    public var length : Int = 4 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    public var inactiveDiameter : CGFloat = 20.0 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    public var inactiveColor : UIColor = .redColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var activeScale : CGFloat = 1.5 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    public var activeColor : UIColor = .blueColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var spacing : CGFloat = 16.0 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    
    private var currentIndex = 0
    private var dotViews : [UIView] = []
    
    override public func drawRect(rect: CGRect) {
    
        for aView in dotViews {
            aView.removeFromSuperview()
        }
        dotViews.removeAll()
        
        
        var origin = CGPointMake(0, CGRectGetHeight(bounds)/2 - inactiveDiameter/2)
        for _ in 0..<length {
            let dotRect = CGRect(origin: origin, size: CGSizeMake(inactiveDiameter, inactiveDiameter))
            
            let aView = UIView()
            aView.frame = dotRect
            aView.backgroundColor = inactiveColor
            aView.layer.cornerRadius = inactiveDiameter/2
            
            
            
            dotViews.append(aView)
            addSubview(aView)
            
            origin.x += inactiveDiameter + spacing
        }
        
        dotViews[currentIndex].transform = CGAffineTransformMakeScale(self.activeScale, self.activeScale)
        dotViews[currentIndex].backgroundColor = self.activeColor
    
    }
    
    
    override public func intrinsicContentSize() -> CGSize {
        let width = CGFloat(length) * (inactiveDiameter + spacing) - spacing
        let height = inactiveDiameter
        return CGSizeMake(width, height)
    }
    
    func next() {
        
        if currentIndex != dotViews.endIndex - 1 {
            
            UIView.animateWithDuration(0.2, animations: {
                self.dotViews[self.currentIndex].transform = CGAffineTransformMakeScale(1.0, 1.0)
                self.dotViews[self.currentIndex].backgroundColor = self.inactiveColor
                
                let nextIndex = self.currentIndex + 1
                
                self.dotViews[nextIndex].transform = CGAffineTransformMakeScale(self.activeScale, self.activeScale)
                self.dotViews[nextIndex].backgroundColor = self.activeColor
                
                self.currentIndex += 1
            })
        }
    }
    
    func pre() {
        
        if currentIndex != dotViews.startIndex{
           
            UIView.animateWithDuration(0.2, animations: {
                self.dotViews[self.currentIndex].transform = CGAffineTransformMakeScale(1.0, 1.0)
                self.dotViews[self.currentIndex].backgroundColor = self.inactiveColor
                
                let preIndex = self.currentIndex - 1
                
                self.dotViews[preIndex].transform = CGAffineTransformMakeScale(self.activeScale, self.activeScale);
                self.dotViews[preIndex].backgroundColor = self.activeColor
                
                self.currentIndex -= 1
            })
        }
    }

}
