//
//  BigViewController.swift
//  SlideshowApp
//
//  Created by 堅田史朗 on 2016/09/19.
//  Copyright © 2016年 堅田史朗. All rights reserved.
//

import UIKit

class BigViewController: UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    var image:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bigImage.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
