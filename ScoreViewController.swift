//
//  ScoreViewController.swift
//  PianoQuiz
//
//  Created by 春木渚咲 on 2021/06/25.
//

import UIKit
import SwiftGifOrigin


class ScoreViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gifImage: UIImageView!
    
   
    var correct = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let incorrect = UserDefaults.standard.array(forKey:"machigae_naiyou")
        print ("\(String(describing: incorrect))")
        
        scoreLabel.text = "\(correct)問正解！"
        
        let image = UIImage.gif(name: "fireworks")
        gifImage.image = image
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
            self.gifImage.isHidden = true
        
        }
        // Do any additional setup after loading the view.
    }
    
    
    //シェアボタン
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました!","#ピアノクイズアプリ","#クイズアプリ","https://apps.apple.com/us/app/%E3%83%94%E3%82%A2%E3%83%8E%E3%82%AF%E3%82%A4%E3%82%BA/id1583394892?itsct=apps_box_link&itscg=30200"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    @IBAction func toTopButtonAction(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
