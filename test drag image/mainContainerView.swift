//
//  mainContainerView.swift
//  test drag image
//
//  Created by george on 9/12/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


 let rect_1 = NSRect(x: 400, y: 50, width: 30, height: 80) //note that layer.position will be default centre anchor point
 let rect_2 = NSRect(x: 15, y: 50, width: 30, height: 80)





class mainContainerView: NSView {
    
    
    
    

    override func awakeFromNib() {
        let click = NSPanGestureRecognizer(target: self,action: #selector(clicked))
        
        //NSPanGestureRecognizer(target: self,action: Selector("pan:"))
        addGestureRecognizer(click)
        
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
      var soundSourceLocation = CGPoint(x: self.frame.size.width/2, y: self.frame.size.height * 0.75)
        
      drawSoundSource(center: soundSourceLocation)
       
        mic1Layer.frame = rect_1
        self.layer?.addSublayer(mic1Layer)
        
        
        mic2Layer.frame = rect_2
        self.layer?.addSublayer(mic2Layer)

        
         //Swift.print(mic1Layer.frame)
        
        
        
       
        Swift.print(self.frame)
       
        mic1Layer.borderWidth = 1.0
        mic1Layer.borderColor = NSColor.green.cgColor
        mic1Layer.masksToBounds = false
        mic1Layer.shadowColor = NSColor.black.cgColor
        mic1Layer.shadowOffset = CGSize(width:5, height: -5)
        mic1Layer.shadowOpacity = 0.2
        mic1Layer.shadowRadius = 3.0
        
        mic1Layer.contents = NSImage(named: "microphone_icon_80x80")
        mic1Layer.contentsGravity = kCAGravityCenter

        
        mic2Layer.borderWidth = 1.0
        mic2Layer.borderColor = NSColor.green.cgColor
        mic2Layer.masksToBounds = false
        mic2Layer.shadowColor = NSColor.black.cgColor
        mic2Layer.shadowOffset = CGSize(width:5, height: -5)
        mic2Layer.shadowOpacity = 0.2
        mic2Layer.shadowRadius = 3.0
        
        mic2Layer.contents = NSImage(named: "microphone_icon_80x80")
        mic2Layer.contentsGravity = kCAGravityCenter

        
        
   //***************************************************************************
   //************** adding another CALayer as sublayer *************************
//        let ndLayer = CALayer()
//        let rect_2 = NSRect(x: 10, y: 10, width: 10, height: 10)
//        layer?.addSublayer(ndLayer)
//        ndLayer.frame = rect_2
//    
//        ndLayer.backgroundColor = NSColor.yellow.cgColor
//        ndLayer.borderWidth = 10.0
//        ndLayer.borderColor = NSColor.green.cgColor
//        ndLayer.shadowOpacity = 0.2
//        ndLayer.shadowRadius = 3
//    
//        ndLayer.contents = NSImage(named: "microphone_icon_80x80")
//        ndLayer.contentsGravity = kCAGravityCenter
//
    }
    
    
    func clicked(gesture: NSPanGestureRecognizer){
        //Swift.print("clicked")
        let translation = gesture.translation(in: self.superview)
        
      
        
        
        if mic1Layer.frame.contains(gesture.location(in: self)){

//          Swift.print(mic1Layer.hitTest(gesture.location(in: self)) as Any)
//          Swift.print (gesture.location(in: self)) //
            
//            Swift.print("inside clicked")
//            Swift.print("translation = \(translation)")
            mic1Layer.position = CGPoint(x: mic1Layer.position.x + translation.x, y: mic1Layer.position.y + translation.y)
            gesture.setTranslation(CGPoint.zero, in: self)
        }
        
        
        
    } //end clicked
    
    
    
    func drawSoundSource(center: NSPoint) -> Void {
        
       let soundSourceIcon = NSBezierPath()
        soundSourceIcon.appendArc(withCenter: center, radius: 5, startAngle: 0, endAngle: 360)
        soundSourceIcon.move(to: NSPoint(x: center.x + 10, y: center.y ))
        soundSourceIcon.appendArc(withCenter: center, radius: 10, startAngle: 0, endAngle: 360)
        
        //soundSourceIcon.setStroke()
        soundSourceIcon.lineWidth = 2
        soundSourceIcon.stroke()
        //soundSourceIcon.fill()
        
    }
    
    
    
    
} // end class
