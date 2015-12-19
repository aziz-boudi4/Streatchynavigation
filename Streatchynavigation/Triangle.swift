//
//  CustomOval.swift
//  triangleBezierNewStack
//
//  Created by aziz omar boudi  on 12/18/15.
//  Copyright © 2015 jogabo. All rights reserved.
//

import UIKit

class Triangle: UIView {

  override func drawRect(rect: CGRect){

    //// Bezier Drawing
    let bezierPath = UIBezierPath()
    bezierPath.moveToPoint(CGPointMake(0, 10))
    bezierPath.addLineToPoint(CGPointMake(11.58, 0))
    bezierPath.addLineToPoint(CGPointMake(22, 10))
    bezierPath.addLineToPoint(CGPointMake(0, 10))
    bezierPath.closePath()
    UIColor(red: 230/255.0, green: 230/255.0, blue: 240/255.0, alpha: 1.0).setFill()
    bezierPath.fill()
    UIColor(red: 230/255.0, green: 230/255.0, blue: 240/255.0, alpha: 1.0).setStroke()
    bezierPath.lineWidth = 1
    bezierPath.stroke()

//    //// Bezier Drawing
//    let bezierPath = UIBezierPath()
//    bezierPath.moveToPoint(CGPointMake(0, 15))
//    bezierPath.addLineToPoint(CGPointMake(7.89, 0))
//    bezierPath.addLineToPoint(CGPointMake(15, 15))
//    bezierPath.addLineToPoint(CGPointMake(0, 15))
//    bezierPath.closePath()
//    UIColor.grayColor().setFill()
//    bezierPath.fill()
//    UIColor.grayColor().setStroke()
//    bezierPath.lineWidth = 1
//    bezierPath.stroke()

}

}