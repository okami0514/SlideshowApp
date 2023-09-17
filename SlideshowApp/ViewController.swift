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
    var imageFileName = "150x150_1.png"
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var goOnButton: UIButton!
    @IBOutlet weak var bachButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    func setImageFileNmae(fileNmae : String) {
        self.imageFileName = fileNmae
    }
    
    func getImageFileNmae()  -> String {
        return self.imageFileName
    }
    
    // タイマー
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.image = UIImage(named: imageName[0])
        stopButton.isHidden = true
        self.setImageFileNmae(fileNmae: imageName[0])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.fileName = self.getImageFileNmae()
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    func timerStop() {
        goOnButton.isEnabled = true
        bachButton.isEnabled = true
        playButton.isHidden = false
        stopButton.isHidden = true
        
        // タイマーを停止
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    // 停止ボタン押下時
    @IBAction func stop(_ sender: Any) {
        self.timerStop()
    }
    
    // 画像タップ時
    @IBAction func tapAction(_ sender: Any) {
        self.timerStop()
        self.performSegue(withIdentifier: "toSecond", sender: self)        
        
    }
    
    // 再生ボタン押下時
    @IBAction func play(_ sender: Any) {
        goOnButton.isEnabled = false
        bachButton.isEnabled = false
        playButton.isHidden = true
        stopButton.isHidden = false
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(goOn(_:)), userInfo: nil, repeats: true)
        }
        
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
        self.setImageFileNmae(fileNmae: name)
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
        self.setImageFileNmae(fileNmae: name)
    }
}

