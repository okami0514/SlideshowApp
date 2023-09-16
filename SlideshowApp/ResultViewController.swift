//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by WEBSYSTEM-MAC29 on 2023/09/16.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var fileName:String = "150x150_1.png"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        image.image = UIImage(named: fileName)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
