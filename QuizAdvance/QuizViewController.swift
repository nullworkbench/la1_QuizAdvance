//
//  QuizViewController.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/10.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet var questionIndexLabel: UILabel!
    @IBOutlet var questionTextView: UITextView!
    @IBOutlet var option1: UIButton!
    @IBOutlet var option2: UIButton!
    @IBOutlet var option3: UIButton!
    
    var quizArray = [Any]()
    var questionIndex: Int = 0
    var correctedAnswers: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // quizArrayに問題を追加
        quizArray.append(["SwiftとXcodeで制作できるものは？", "Androidアプリ", "iOSアプリ", "Webアプリ", 2])
        quizArray.append(["文字列を示す型は？", "String", "Int", "Float", 1])
        quizArray.append(["1 + 1の答えを出力するのは？", "print(\"1\" + \"1\")", "print(1 + 1)", "print(\"1 + 1\")", 2])
        
        // 問題をシャッフル
        quizArray.shuffle()
        
        // クイズスタート
        nextQ()
    }
    
    // resultViewへ遷移する前に問題数と正解数を渡しておく
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultViewController" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctedAnswers = self.correctedAnswers
            resultViewController.numberOfQuestions = self.quizArray.count
        }
    }
    
    func nextQ() {
        // 何問目か表示
        questionIndexLabel.text = "Question. \(questionIndex + 1)"
        
        // 問題を一時的に格納
        let questionArray = quizArray[questionIndex] as! [Any]
        
        // 問題文表示
        questionTextView.text = questionArray[0] as? String
        
        // 選択肢に反映
        option1.setTitle(questionArray[1] as? String, for: .normal)
        option2.setTitle(questionArray[2] as? String, for: .normal)
        option3.setTitle(questionArray[3] as? String, for: .normal)
    }
    
    func finishQuiz() {
        performSegue(withIdentifier: "toResultViewController", sender: nil)
    }
    
    @IBAction func optionSelected(sender: UIButton) {
        // 問題を一時的に格納
        let questionArray = quizArray[questionIndex] as! [Any]
        
        // 正解判定
        if sender.tag == questionArray[4] as! Int {
            correctedAnswers += 1
        }
        
        // まだ問題が残っていたら、Indexを増やして次の問題へ
        if questionIndex < quizArray.count - 1 {
            questionIndex += 1
            self.nextQ()
        } else {
            self.finishQuiz()
        }
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
