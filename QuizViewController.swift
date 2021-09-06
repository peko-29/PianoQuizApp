//
//  QuizViewController.swift
//  PianoQuiz
//
//  Created by 春木渚咲 on 2021/06/25.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizTextView: UIImageView!
    @IBOutlet weak var answerButton1: UIButton! //鍵盤
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var answerButton5: UIButton!
    @IBOutlet weak var answerButton6: UIButton!
    @IBOutlet weak var answerButton7: UIButton!
    @IBOutlet weak var answerButton8: UIButton!
    @IBOutlet weak var answerButton9: UIButton!
    @IBOutlet weak var answerButton10: UIButton!
    @IBOutlet weak var answerButton11: UIButton!
    @IBOutlet weak var answerButton12: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    @IBOutlet weak var answerImage: UIImageView!
    
    var bannerView: GADBannerView!
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0
    var correctCount = 0
    var selectLebel = 0
    var selectQuiz = 0
    var player:AVAudioPlayer!
    var image_no :Int = 0
    var continuity = 1
    var incorrect = Array(repeating: 0, count: 7)
    var review_continue = 0
    var incorent_csv:[String] = []
    
    var score1 :UIImage = UIImage(named:"c")! //問題画像
    var score2 :UIImage = UIImage(named:"d")!
    var score3 :UIImage = UIImage(named:"e")!
    var score4 :UIImage = UIImage(named:"f")!
    var score5 :UIImage = UIImage(named:"g")!
    var score6 :UIImage = UIImage(named:"a")!
    var score7 :UIImage = UIImage(named:"h")!
    var score8 :UIImage = UIImage(named:"h#")!
    var score9 :UIImage = UIImage(named:"c#")!
    var score10 :UIImage = UIImage(named:"d#")!
    var score11 :UIImage = UIImage(named:"e#")!
    var score12 :UIImage = UIImage(named:"f#")!
    var score13 :UIImage = UIImage(named:"g#")!
    var score14 :UIImage = UIImage(named:"a#")!
    var score15 :UIImage = UIImage(named:"db")!
    var score16 :UIImage = UIImage(named:"eb")!
    var score17 :UIImage = UIImage(named:"fb")!
    var score18 :UIImage = UIImage(named:"gb")!
    var score19 :UIImage = UIImage(named:"ab")!
    var score20 :UIImage = UIImage(named:"hb")!
    var score21 :UIImage = UIImage(named:"cb")!
    var image1 :UIImage = UIImage(named:"do")! //回答イラスト
    var image2 :UIImage = UIImage(named:"re")!
    var image3 :UIImage = UIImage(named:"mi")!
    var image4 :UIImage = UIImage(named:"fa")!
    var image5 :UIImage = UIImage(named:"so")!
    var image6 :UIImage = UIImage(named:"ra")!
    var image7 :UIImage = UIImage(named:"si")!
    var image8 :UIImage = UIImage(named:"do#")!
    var image9 :UIImage = UIImage(named:"re#")!
    var image10 :UIImage = UIImage(named:"fa#")!
    var image11 :UIImage = UIImage(named:"so#")!
    var image12 :UIImage = UIImage(named:"ra#")!
    var image13 :UIImage = UIImage(named:"si#")!
    var image14 :UIImage = UIImage(named:"mi#")!
    var image15 :UIImage = UIImage(named:"reb")!
    var image16 :UIImage = UIImage(named:"mib")!
    var image17 :UIImage = UIImage(named:"fab")!
    var image18 :UIImage = UIImage(named:"sob")!
    var image19 :UIImage = UIImage(named:"rab")!
    var image20 :UIImage = UIImage(named:"sib")!
    var image21 :UIImage = UIImage(named:"dob")!
   
    
    var imgArray:[UIImage] = []
    var answerArray:[UIImage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //広告のAPI
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        
        //print("復習モード\(review_continue)")
        
        //問題画像の配列
        imgArray = [score1,score2,score3,score4,score5,score6,score7,score8,score9,score10,score11,score12,score13,score14,score15,score16,score17,score18,score19,score20,score21]
        
        //回答イラストの配列
        answerArray =
            [image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21]
        
        //レベルの選択
        csvArray = loadCSV(fileName: "quiz\(selectLebel)")
        print("選択したのはレベル\(selectLebel)")
        
        //問題をシャッフル
        csvArray.shuffle()
        print (csvArray)
        
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        let image_no :Int = Int(quizArray[0])!
        
        //問題画像を表示
        quizTextView.image = imgArray[(image_no - 1)]
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
    
        // ビューを読み込んだ後に、追加の設定を行います。
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            //エラーの回避
        }
    
    //スコア画面に遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
    }
    
    //鍵盤を押した処理
    @IBAction func btnAction(sender: UIButton) {
       
        let sound2 :Int = sender.tag
        let sound :String = sound2.description
        
        let path = Bundle.main.path(forResource: sound, ofType: "mp3")
             do{
                player = try AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: path!) as URL)
                player.play()
             } catch {
                
             }

        print("sender.tag\(sender.tag)")
        print("anser_no:\(quizArray[1])")
        
        //正誤判定
        if sender.tag == (Int(quizArray[1])) {
            print("正解")
            if (continuity == 1) {correctCount += 1}
            
                quizCount += 1
                judgeImageView.image = UIImage(named: "correct")
            
            let jituon = enharmonic(karion: sender.tag )
                print ("正jituon \(jituon)")
                answerImage.image = answerArray [jituon - 1]
                continuity = 1
            } else {
                print("不正解")
                judgeImageView.image = UIImage(named: "incorrect")
                
                let jituon = enharmonic(karion: sender.tag )
                print ("誤jituon \(jituon)")
                answerImage.image = answerArray [jituon - 1]
                continuity = 0
                incorrect[quizCount] = sender.tag
                
                UserDefaults.standard.set(incorrect, forKey:"machigae_naiyou")
            }
        
        print("スコア:\(correctCount)")
        
        //正誤判定を表示
        judgeImageView.isHidden = false
        answerImage.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        answerButton4.isEnabled = false
        answerButton5.isEnabled = false
        answerButton6.isEnabled = false
        answerButton7.isEnabled = false
        answerButton8.isEnabled = false
        answerButton9.isEnabled = false
        answerButton10.isEnabled = false
        answerButton11.isEnabled = false
        answerButton12.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgeImageView.isHidden = true
            self.answerImage.isHidden = true
            self.answerButton1.isEnabled = true
            self.answerButton2.isEnabled = true
            self.answerButton3.isEnabled = true
            self.answerButton4.isEnabled = true
            self.answerButton5.isEnabled = true
            self.answerButton6.isEnabled = true
            self.answerButton7.isEnabled = true
            self.answerButton8.isEnabled = true
            self.answerButton9.isEnabled = true
            self.answerButton10.isEnabled = true
            self.answerButton11.isEnabled = true
            self.answerButton12.isEnabled = true
            self.nextQuiz()
        }
    }
    
    //次の問題に遷移
    func nextQuiz() {
        
        imgArray = [score1,score2,score3,score4,score5,score6,score7,score8,score9,score10,score11,score12,score13,score14,score15,score16,score17,score18,score19,score20,score21]
        
        answerArray =
            [image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21]
        
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            
            let image_no :Int = Int(quizArray[0])!
            quizTextView.image = imgArray[(image_no-1)]
            print("img_no\(image_no)")
            print("csvArray.count:\(csvArray.count)")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            
            
        } else {
            performSegue(withIdentifier: "toScoreVC", sender: nil)
            UserDefaults.standard.set(selectLebel, forKey:"level")
            let incorrectCount = quizCount - correctCount
            UserDefaults.standard.set(incorrectCount, forKey:"machigae_suu")

            
            
        }
    }
    
    //CSVファイルの読み込み
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    //広告バナーの処理
    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
            NSLayoutConstraint(item: bannerView,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0)
            ])
    }
    
    var array: [String] = []
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        array = quizArray
        return true
    }
    
    //鍵盤を押した判定
    func enharmonic(karion:Int)-> Int {
        print ("karion \(karion)")
        if selectLebel == 1{
            return karion
        }
        else if selectLebel == 2 {
            if      karion == 1 { return  13 }
            else if karion == 4 { return  14 }
            else { return karion  }
            
        }
        else if selectLebel == 3 {
            if      karion == 3 { return  17 }
            else if karion == 7 { return  21 }
            else if karion == 8 { return  15 }
            else if karion == 9 { return  16 }
            else if karion == 10 { return  18 }
            else if karion == 11 { return  19 }
            else if karion == 12 { return  20 }
            else { return karion  }
            
        }
        else{ return karion }
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

