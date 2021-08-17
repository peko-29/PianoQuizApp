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

    //正解数を表示
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
    
    
    //シェア機能
    @IBAction func shareButtonAction(_ sender: Any) {
        let activityItems = ["\(correct)問正解しました!","#クイズアプリ"]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        self.present(activityVC, animated: true)
    }
    
    //トップに戻る
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
