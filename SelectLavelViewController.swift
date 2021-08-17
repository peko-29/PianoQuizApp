//
//  SelectLavelViewController.swift
//  PianoQuiz
//
//  Created by 春木渚咲 on 2021/08/07.
//

import UIKit

class SelectLavelViewController: UIViewController {
    
    var selectTag = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //レベルを選択
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizVC = segue.destination as! QuizViewController
        quizVC.selectLebel = selectTag
    }
    
    @IBAction func levelButtonAction(sender: UIButton) {
        print(sender.tag)
        selectTag = sender.tag
        performSegue(withIdentifier: "toQuizVC", sender: nil)
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
