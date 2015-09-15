//
//  ViewController.swift
//  circleProgress
//
//  Created by 永生 黄 on 15/9/15.
//  Copyright © 2015年 永生 黄. All rights reserved.
//

import UIKit
import Darwin

class ViewController: UIViewController {
    
    var shaperLayer = CAShapeLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //创建出CAShapeLayer
        shaperLayer.frame = CGRectMake(0, 0, 200, 200)
        shaperLayer.position = self.view.center
        shaperLayer.fillColor = UIColor.greenColor().CGColor
        
        //设置线条的宽度和颜色
        shaperLayer.lineWidth = 10
        shaperLayer.lineCap = kCALineCapRound
        shaperLayer.strokeColor = UIColor.redColor().CGColor
        
        //创建出圆形贝塞尔曲线
        let start = CGFloat(-M_PI_2)
        let end = CGFloat(1.5*M_PI)
        let circlePath = UIBezierPath(arcCenter: shaperLayer.position, radius: 100, startAngle: start, endAngle: end, clockwise: true)
        
        //让贝塞尔曲线与CAShapeLayer产生联系
        shaperLayer.path = circlePath.CGPath
        
        //添加并显示
        self.view.layer.addSublayer(shaperLayer)
        
        shaperLayer.strokeStart = 0.0
        shaperLayer.strokeEnd = 0.0
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "progress", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func progress() {
        if shaperLayer.strokeEnd >= 1 {
            shaperLayer.strokeStart = 0.0
            shaperLayer.strokeEnd = -0.1
        } else {
            shaperLayer.strokeEnd += 0.1
        }
    }
}

