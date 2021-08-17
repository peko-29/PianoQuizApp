//
//  ReviewViewController.swift
//  PianoQuiz
//
//  Created by 春木渚咲 on 2021/08/15.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet weak var quizButton1: UIButton!
    @IBOutlet weak var quizButton2: UIButton!
    @IBOutlet weak var quizButton3: UIButton!
    @IBOutlet weak var quizButton4: UIButton!
    @IBOutlet weak var quizButton5: UIButton!
    
    var ReviewArray: [String] = []
    var selectTag = 0
    
    //復習機能
    override func viewDidLoad() {
        super.viewDidLoad()
        let incorrect = UserDefaults.standard.array(forKey:"machigae_naiyou")
        let level = UserDefaults.standard.integer(forKey:"level")
        let incorrect_count = UserDefaults.standard.integer(forKey:"machigae_suu")
        
        print ("BOXの中身\(String(describing: incorrect))")
        print ("レベル：\(String(describing: level))")
        print ("間違い数:\(String(describing: incorrect_count))")
        
        quizButton1.setTitle("レベル\(level) 間違え数\(incorrect_count)", for: .normal)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:Any?) {
        let reviewVC = segue.destination as! QuizViewController
        reviewVC.selectLebel = selectTag
    }
    
    
    
    @IBAction func ReviewBunttonAvtion(sender: UIButton) {
        selectTag = sender.tag
        performSegue(withIdentifier: "toReviewVC", sender: nil)
    }
    
    @IBAction func toTopButtonAction2(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
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
