//
//  QuizzesDetailViewController.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/10.
//

import UIKit

class QuizzesDetailViewController: UIViewController {
    
    // QuizzezViewから受け取る
    var quizIndex: Int = 0
    
    var quizArray = UserDefaults.standard.array(forKey: "quizArray")!
    
    @IBOutlet var questionTextView: UITextView!
    @IBOutlet var option1TextField: UITextField!
    @IBOutlet var option2TextField: UITextField!
    @IBOutlet var option3TextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let quiz = quizArray[quizIndex] as! [Any]
        
        questionTextView.text = quiz[0] as? String
        option1TextField.text = quiz[1] as? String
        option2TextField.text = quiz[2] as? String
        option3TextField.text = quiz[3] as? String
    }
    
    @IBAction func save() {
        // quizで一時的に変更内容を保存
        var quiz = quizArray[quizIndex] as! [Any]
        
        quiz[0] = questionTextView.text!
        quiz[1] = option1TextField.text!
        quiz[2] = option2TextField.text!
        quiz[3] = option3TextField.text!
        
        // quizArray（他のQuiz）と統合
        quizArray[quizIndex] = quiz
        
        // 保存
        UserDefaults.standard.set(quizArray, forKey: "quizArray")
        
        // アラート
        let alert = UIAlertController(title: "Successfuly Saved!", message: "Your Quiz was saved successfuly.", preferredStyle: .alert)
        // OKボタンを押したら画面を閉じる
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        // アラート発火
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dismiss() {
        self.dismiss(animated: true, completion: nil)
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
