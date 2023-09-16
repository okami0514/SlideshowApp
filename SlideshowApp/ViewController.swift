//
//  ViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC29 on 2023/09/16.
//

import UIKit

class ViewController: UIViewController {
    let imageName = ["150x150_1.png", "150x150_2.png", "150x150_3.png"]
    var changeImgNo = 0
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var goOnButton: UIButton!
    @IBOutlet weak var bachButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.image = UIImage(named: imageName[0])
        stopButton.isHidden = true
    }
    
    // 停止ボタン押下時
    @IBAction func stop(_ sender: Any) {
        goOnButton.isEnabled = true
        bachButton.isEnabled = true
        playButton.isHidden = false
        stopButton.isHidden = true
    }
    
    // 進むボタン押下時
    @IBAction func play(_ sender: Any) {
        goOnButton.isEnabled = false
        bachButton.isEnabled = false
        playButton.isHidden = true
        stopButton.isHidden = false
    }
    
    // 戻るボタン押下時
    @IBAction func back(_ sender: Any) {
        
        if changeImgNo == 0 {
            changeImgNo = 2
        } else if changeImgNo == 1 {
            changeImgNo = 0
        } else if changeImgNo == 2 {
            changeImgNo = 1
        }
        let name = imageName[changeImgNo]
        image.image = UIImage(named: name)
    }

    // 進むボタン押下時
    @IBAction func goOn(_ sender: Any) {
        
        if changeImgNo == 0 {
            changeImgNo = 1
        } else if changeImgNo == 1 {
            changeImgNo = 2
        } else if changeImgNo == 2 {
            changeImgNo = 0
        }
        let name = imageName[changeImgNo]
        image.image = UIImage(named: name)
    }
}

