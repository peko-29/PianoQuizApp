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
    @IBOutlet weak var answerButton1: UIButton! //鍵盤ボタン
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
    
    @IBAction func backButtonAction(_ sender:Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
    }
    
    var bannerView: GADBannerView!
    var csvArray: [String] = []
    var quizArray: [String] = []
    var quizCount = 0 //何問目
    var correctCount = 0 //連続正解数
    var selectLebel = 0 //0は間違いのファイル
    var player:AVAudioPlayer!
    var image_no :Int = 0 //音符のイラストの番号
    var continuity = 1 //1が新規 0が復習モード
    var incorrect = Array(repeating: 0, count: 7)
    var box = 1
    var review_continue = 0
    var incorrectCount = 0
    var documentURL : URL = URL(string: "https://qiita.com")!
    
    var employeeArray:[Dictionary<String, AnyObject>] =  Array()
    
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
    var score22 :UIImage = UIImage(named:"lv2c")!
    var score23 :UIImage = UIImage(named:"lv2d")!
    var score24 :UIImage = UIImage(named:"lv2e")!
    var score25 :UIImage = UIImage(named:"lv2f")!
    var score26 :UIImage = UIImage(named:"lv2g")!
    var score27 :UIImage = UIImage(named:"lv2a")!
    var score28 :UIImage = UIImage(named:"lv2h")!
    var score29 :UIImage = UIImage(named:"lv3c")!
    var score30 :UIImage = UIImage(named:"lv3d")!
    var score31 :UIImage = UIImage(named:"lv3e")!
    var score32 :UIImage = UIImage(named:"lv3f")!
    var score33 :UIImage = UIImage(named:"lv3g")!
    var score34 :UIImage = UIImage(named:"lv3a")!
    var score35 :UIImage = UIImage(named:"lv3h")!
    var score36 :UIImage = UIImage(named:"c8")!
    var score37 :UIImage = UIImage(named:"d8")!
    var score38 :UIImage = UIImage(named:"e8")!
    var score39 :UIImage = UIImage(named:"f8")!
    var score40 :UIImage = UIImage(named:"g8")!
    var score41 :UIImage = UIImage(named:"a8")!
    var score42 :UIImage = UIImage(named:"h8")!
    var score43 :UIImage = UIImage(named:"c82")!
    var score44 :UIImage = UIImage(named:"lv2c82")!
    var score45 :UIImage = UIImage(named:"lv2d8")!
    var score46 :UIImage = UIImage(named:"lv2e8")!
    var score47 :UIImage = UIImage(named:"lv2f8")!
    var score48 :UIImage = UIImage(named:"lv2g8")!
    var score49 :UIImage = UIImage(named:"lv2a8")!
    var score50 :UIImage = UIImage(named:"lv2h8")!
    var score51 :UIImage = UIImage(named:"lv28c")!
    
    var image1 :UIImage = UIImage(named:"do")! //正解画像
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
        


        //CSVファイルの保存先
        let fm = FileManager.default
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        print ("documentsPath:\(documentsPath)")
        documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        for i in 1..<6 {
            let filePath = documentsPath + "/Review\(i).csv"
            if !fm.fileExists(atPath: filePath) { //ファイルがない時ファイルを作る
                fm.createFile(atPath: filePath, contents: nil, attributes: [:])
            }
        }

        //広告のAPI
        bannerView = GADBannerView(adSize: kGADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-6575136484315106/4641084138"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        addBannerViewToView(bannerView)
        print("選択したのはレベル\(selectLebel)")
        print("復習モード\(review_continue)")
        
        //問題画像の配列
        imgArray = [score1,score2,score3,score4,score5,score6,score7,score8,score9,score10,score11,score12,score13,score14,score15,score16,score17,score18,score19,score20,score21,score22,score23,score24,score25,score26,score27,score28,score29,score30,score31,score32,score33,score34,score35,score36,score37,score38,score39,score40,score41,score42,score43,score44,score45,score46,score47,score48,score49,score50,score51]
        
        //回答イラストの配列
        answerArray =
            [image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21]
                
        box = searchBox()
        print ("box_no \(box)")
        
    //間違いがなかったらレベル0にする
        for ii in  1..<6 {
            let checkArray = loadCSV2(fileName: "//Review\(ii)")
            if checkArray == [] {
                UserDefaults.standard.set(0, forKey:"level\(ii)")
                UserDefaults.standard.set(0, forKey:"machigae_suu\(ii)")
                }
            }
        
        //復習ボタンの何番が押されたか調べる
        review_continue = UserDefaults.standard.integer(forKey:"review_continue")

        print ("review_continue:\(review_continue)")//0は新規
        

        if review_continue == 0 {
            csvArray = loadCSV(fileName: "quiz\(selectLebel)") //レベルを選択
        
        } else {
            box = review_continue
            csvArray = loadCSV2(fileName: "//Review\(box)") //復習モード
        }
        
        csvArray.shuffle()
        print ("問題と答え:\(csvArray)") //問題と答え
        quizArray = csvArray[quizCount].components(separatedBy: ",") //何問目か
        
        //問題画像を表示
        let image_no :Int = Int(quizArray[0])!
        quizTextView.image = imgArray[(image_no - 1)]
        
        //復習モードの時のレベルを表示
        if !(review_continue == 0) {selectLebel = Int(quizArray[2])! }
        
        //何問目かを表示
        quizNumberLabel.text = "第\(quizCount + 1)問"
    
        // ビューを読み込んだ後に、追加の設定を行います。
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            //再現可能なリソースを破棄します。
        }
    
    //スコア画面に遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! ScoreViewController
        scoreVC.correct = correctCount
        box += 1
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

        print("sender.tag\(sender.tag)") //押した鍵盤
        print("anser_no:\(quizArray[1])") //答え
        
        //正誤判定
        if sender.tag == (Int(quizArray[1])) {
            print("正解")
            if (continuity == 1) {correctCount += 1} //連続正解数をカウント
    
                quizCount += 1 //問題数
                judgeImageView.image = UIImage(named: "correct")
            
            let jituon = enharmonic(karion: sender.tag ) //異名同音の判定
                print ("正jituon \(jituon)")
                //イラストの表示
                answerImage.image = answerArray [jituon - 1]
                continuity = 1
            } else {
                print("不正解")
                judgeImageView.image = UIImage(named: "incorrect")
                
                //異名同音の不正解
                let jituon = enharmonic(karion: sender.tag )
                print ("誤jituon \(jituon)")
                


                let url = documentURL   // Reviewファイルの場所
                let fileURL = URL(string:
                                    url.description.description + "/Review\(box).csv")
            
                print ("fileURL:\(String(describing: fileURL))")

                print("box：\(box)")
                //問題と答え
                print ("csv:\(quizArray[0]),\(quizArray[1])")
                
                //レベルを文字列にする
                let quizArray_2 = String (selectLebel)
                let textData:String = "\(quizArray[0]),\(quizArray[1]),\(quizArray_2)\n" //問題と答えとレベルと改行をtextDataに入れる

                let string = textData.description //文字列にする
                print ("string:\(string)")
            
                //前回が正解なら書き込み(初めて間違えた時)
                if ((continuity == 1) && (review_continue == 0 )){
                    let boo = writeCsv( url: fileURL! , text: string )
                    if (boo) {}
                    }
                //イラストの表示
                answerImage.image = answerArray [jituon - 1]
                continuity = 0
                
            }
        
        print("スコア:\(correctCount)")
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
        
        //問題画像の配列
        imgArray = [score1,score2,score3,score4,score5,score6,score7,score8,score9,score10,score11,score12,score13,score14,score15,score16,score17,score18,score19,score20,score21,score22,score23,score24,score25,score26,score27,score28,score29,score30,score31,score32,score33,score34,score35,score36,score37,score38,score39,score40,score41,score42,score43,score44,score45,score46,score47,score48,score49,score50,score51]
        
        //回答イラストの配列
        answerArray =
            [image1,image2,image3,image4,image5,image6,image7,image8,image9,image10,image11,image12,image13,image14,image15,image16,image17,image18,image19,image20,image21]
        
        
        
        if quizCount < csvArray.count {
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            
            let image_no :Int = Int(quizArray[0])!
            quizTextView.image = imgArray[(image_no-1)]
            print("img_no\(image_no)")
            print("csvArray.count:\(csvArray.count)")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            
            //復習モードの時はquiz0の3番目をレレベルを読み込み
            if review_continue == 1 {selectLebel = Int(quizArray[2])! }
            
            
        } else {
            
            //間違えた数を計算
            incorrectCount = quizCount - correctCount
            
            if (incorrectCount > 0)  {
                if (review_continue == 0) {
                //復習画面用にレベルを記録
                UserDefaults.standard.set(selectLebel, forKey:"level\(box)")
                //復習画面用に間違えた数を記録
                UserDefaults.standard.set(incorrectCount, forKey:"machigae_suu\(box)")
                }
            }
            else {
                let url = documentURL   // Reviewファイルの場所

                let filename = "/Review\(box).csv"
                let path = url.appendingPathComponent(filename)
                let documentDirectoryFileURL = path
                let testText = ""
                let data: Data? = testText.data(using: .utf8)
                guard let textFile = data else { return }
                do {
                    try textFile.write(to: documentDirectoryFileURL)
                    print("書き込み成功した")
                } catch {
                    print("書き込み失敗した")
                }

            }
            //スコア画面に遷移
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
    }
    
    //CSVファイルを読み込み
    func loadCSV(fileName: String) -> [String] {
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")! //保存されている問題ファイルの場所を調べる
        print ("loadCSV_csvBundle:\(csvBundle)")
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8) //調べた場所のquiz0~3を読み込み
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n") //ゴミを見つけたら改行
            csvArray = lineChange.components(separatedBy: "\n") //改行を消してcsvArrayに保存
            csvArray.removeLast() //csvファイルのゴミを削除
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    //復習ファイルの場所を調べる
    func loadCSV2(fileName: String) -> [String] {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let csvBundle = documentsPath  + fileName + ".csv"
        print ("csvBundle:\(csvBundle)")
        
 //保存されているファイルの場所を調べる
        do {
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8) //調べた場所のquiz0~3を読み込み
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n") //ゴミを見つけたら改行
            csvArray = lineChange.components(separatedBy: "\n") //改行を消してcsvArrayに保存
            csvArray.removeLast() //csvファイルのゴミを削除
        } catch {
            print("エラー!")
        }
        return csvArray
    }
    
    //書き込む関数
    func writeCsv(url: URL, text: String) -> Bool {
        print ("writeCSVURL:\(url)")
        //指定されたURLのファイルを取り込む tureは追記モード
        guard let stream = OutputStream(url: url , append: true) else {
               return false
           }
           stream.open()
           
           defer {
               stream.close()
           }
           //何を書き込むか
           guard let data = text.data(using: .utf8) else { return false }
           
            //biteに変換
           let result = data.withUnsafeBytes {
               stream.write($0, maxLength: data.count)
           }
           return (result > 0)
        
    }

    //復習の箱を調べる
    func searchBox() -> Int {
        for i in 1..<6 {
            let reviewArray = loadCSV2(fileName: "//Review\(i)")
            print ("Review\(i):\(reviewArray)")
            if  reviewArray == [] {
                let boxN = i
                print ("boxN:\(boxN)")
                return boxN
            }
        }
        let boxN = Int.random(in: 1..<6) //箱がいっぱいだったらランダムに記入
        return (boxN)
    }
        
    //広告バナー
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
    
    //異名同音の定義
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
