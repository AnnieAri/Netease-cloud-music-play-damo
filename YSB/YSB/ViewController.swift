//
//  ViewController.swift
//  YSB
//
//  Created by Ari on 2016/12/10.
//  Copyright © 2016年 Ari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isPause: Bool = false
    var angel: Double = 0
    let imageView = SBView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    let handel = UIImageView(image: #imageLiteral(resourceName: "cm2_play_needle_play"))
    var timer:Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor.red
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(imageView)
        imageView.center = view.center
        handel.frame.origin = CGPoint(x: imageView.center.x - 80, y: imageView.frame.origin.y - 180)
        handel.layer.anchorPoint = CGPoint(x: 0.2, y: 0.2)
        view.addSubview(handel)
        let timer = Timer.init(timeInterval: 0.01, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        self.timer = timer
        RunLoop.current.add(timer, forMode: .commonModes)
    }
    @objc func update(){
        angel += M_PI * 2 / 800
//        CGAffineTransform(rotationAngle: CGFloat(angel))
        imageView.layer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(angel)))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isPause {
            UIView.animate(withDuration: 0.25, animations: { 
                self.handel.layer.setAffineTransform(CGAffineTransform.identity)
            })
            timer.fireDate = Date.init(timeIntervalSinceNow: 0.01)
        }else {
            timer.fireDate = Date.distantFuture
            UIView.animate(withDuration: 0.25, animations: {
                self.handel.layer.setAffineTransform(CGAffineTransform(rotationAngle: -(CGFloat)(M_PI_4 / 2)))
            })
        }
        isPause = !isPause
    }

}

