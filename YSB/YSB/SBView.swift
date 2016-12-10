//
//  SBView.swift
//  YSB
//
//  Created by Ari on 2016/12/10.
//  Copyright © 2016年 Ari. All rights reserved.
//

import UIKit

class SBView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        let imageViewBG = UIImageView(image: #imageLiteral(resourceName: "cm2_play_disc"))
        let SbPhoto = UIImage.init(contentsOfFile: Bundle.main.path(forResource: "IMG_1543", ofType: "JPG")!)
        let SbimageView = UIImageView(image: SbPhoto!)
        addSubview(SbimageView)
        addSubview(imageViewBG)
        SbimageView.frame = self.bounds
        imageViewBG.frame = bounds
        SbimageView.layer.cornerRadius = bounds.size.width  - 20
        SbimageView.layer.masksToBounds = true
    }
}
