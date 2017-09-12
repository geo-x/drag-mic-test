//
//  mainContainerView.swift
//  test drag image
//
//  Created by george on 9/12/17.
//  Copyright © 2017 george. All rights reserved.
//

import Cocoa


 let rect_1 = NSRect(x: 200, y: 100, width: 30, height: 80)


class mainContainerView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
       
        
       let layer = self.layer
        
         Swift.print(self.bounds)
        
        self.frame = rect_1
        
       
        Swift.print(self.frame)
       
        layer?.borderWidth = 1.0
        layer?.borderColor = NSColor.green.cgColor
        layer?.masksToBounds = false
        layer?.shadowColor = NSColor.black.cgColor
        layer?.shadowOffset = CGSize(width:5, height: -5)
        layer?.shadowOpacity = 0.2
        layer?.shadowRadius = 3.0
        
    
        
        layer?.contents = NSImage(named: "microphone_icon_80x80")
        layer?.contentsGravity = kCAGravityCenter
        
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
    
}
