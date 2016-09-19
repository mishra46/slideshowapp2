//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 堅田史朗 on 2016/09/18.
//  Copyright © 2016年 堅田史朗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var ChangeButton: UIButton!
    @IBOutlet weak var stepButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var SlideView: UIImageView!
    
    let image1: UIImage = UIImage(named: "1数字-イラスト-素材.jpg")!
    let image2: UIImage = UIImage(named: "2数字-イラスト-素材.jpg")!
    let image3: UIImage = UIImage(named: "3数字-イラスト-素材.jpg")!
    
    var number = 1
    var ButtonMode = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SlideView.image = image1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func imageButton(sender: AnyObject) {
        performSegueWithIdentifier("big", sender: nil)
    }
    
    @IBAction func stepButton(sender: AnyObject) {
        switch number {
        case 1:
            number += 1
            SlideView.image = image2
        case 2:
            number += 1
            SlideView.image = image3
        case 3:
            number -= 2
            SlideView.image = image1
        default:
            return
        }
    }
    
    @IBAction func backButton(sender: AnyObject) {
        switch number {
        case 1:
            number += 2
            SlideView.image = image3
        case 2:
            number -= 1
            SlideView.image = image1
        case 3:
            number -= 1
            SlideView.image = image2
        default:
            return
        }
    }
    
    @IBAction func playButton(sender: AnyObject) {
        if ButtonMode == 0 {
            ButtonMode = 1
            ChangeButton.setTitle("停止", forState: .Normal)
            stepButton.enabled = false
            backButton.enabled = false
            
            let images = [image1,image2,image3]
            let item = images.count
            
            SlideView.animationImages = images
            SlideView.animationDuration = Double(item) * 2.0
            SlideView.startAnimating()
        } else {
            ButtonMode = 0
            ChangeButton.setTitle("再生", forState: .Normal)
            stepButton.enabled = true
            backButton.enabled = true
            SlideView.stopAnimating()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        let bigViewController:BigViewController = segue.destinationViewController as! BigViewController
        bigViewController.image = SlideView.image
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }
}

