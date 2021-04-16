//
//  BoardView.swift
//  Tiles
//
//  Created by Michael Yuzhou Fu on 3/5/21.
//

import UIKit

class BoardView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        //print(bounds)
        drawBoard()
        drawLetters()
        
    }
    
    func drawLetters() {
        
    }
    
    private func drawBoard(){
        let path = UIBezierPath()
        
        for i in 1...20 {
            path.move(to: CGPoint(x: 0, y: Int(bounds.height) * i / 20))
            path.addLine(to: CGPoint(x: bounds.width, y: bounds.height * CGFloat(i) / 20))
        }

        for i in 1...20 {
            path.move(to: CGPoint(x: Int(bounds.width) * i / 20, y: 0))
            path.addLine(to: CGPoint(x: CGFloat(Int(bounds.width)) * CGFloat(i) / 20, y: bounds.height))
        }
        
        /*
        path.move(to: CGPoint(x: 0, y: bounds.height / 20))
        path.addLine(to: CGPoint(x: bounds.width, y: bounds.height / 20))
        */
        
        path.lineWidth = 3
        #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1).setStroke()
        path.stroke()
    }


}
