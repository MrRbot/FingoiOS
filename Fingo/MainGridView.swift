//
//  MainGridView.swift
//  Fingo
//
//  Created by Javier on 23/03/17.
//  Copyright © 2017 MrRobot. All rights reserved.
//

import UIKit

@IBDesignable

class MainGridView: UIView {

    private let lineWidth: CGFloat = 3.0
    private var viewHeight: CGFloat!
    private var viewWidth: CGFloat!
    
    
    override func draw(_ rect: CGRect) {
        
        drawGrid(numberOfRows: 5.0, numberOfColumns: 5.0)
    }
    
    func drawGrid( numberOfRows: CGFloat, numberOfColumns: CGFloat) {
        
        viewHeight = self.layer.bounds.height
        viewWidth = self.layer.bounds.width
        
        self.layer.borderWidth = 3.0
        self.layer.borderColor = UIColor.purple.cgColor
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setLineWidth(lineWidth)
            context.setStrokeColor(UIColor.purple.cgColor)
            let cellRowLength:CGFloat = viewHeight / numberOfRows
            let cellColumnLength:CGFloat = viewWidth / numberOfColumns
            
            let x1:CGFloat = 0.0
            let x2:CGFloat = viewWidth
            
            let y1:CGFloat = 0.0
            let y2:CGFloat = viewHeight
            
            var i:CGFloat = 0.0
            repeat {
                
                context.move(to: CGPoint(x: x1, y: cellRowLength + i))
               
                context.addLine(to: CGPoint(x: x2, y: cellRowLength + i))
                
                i = i + cellRowLength
                
            } while i < viewHeight - cellRowLength
            
            
            // draw vertical lines
            var j:CGFloat = 0.0
            repeat {
                
                context.move(to: CGPoint(x: cellColumnLength + j, y: y1 ))
                
                context.addLine(to: CGPoint(x: cellColumnLength + j, y: y2))
                
                j = j + cellColumnLength
                
            } while j < viewWidth - cellColumnLength
            
            
           
            context.strokePath()
            
            
        }
        
        
        
        
        

    }

}
