//
//  CreateQuizViewController.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/11.
//

import UIKit

class CreateQuizViewController: UIViewController {
    
    @IBOutlet var questionTextView: UITextView!
    @IBOutlet var option1TextField: UITextField!
    @IBOutlet var option2TextField: UITextField!
    @IBOutlet var option3TextField: UITextField!
    @IBOutlet var correctAnswer: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func judgeEmpties() -> String {
        if questionTextView.text == "" && option1TextField.text == "" && option2TextField.text == "" && option3TextField.text == "" {
            return "0"
        } else {
            if questionTextView.text == "" {
                return "Option 3"
            } else if option1TextField.text == "" {
                return "Option 2"
            } else if option2TextField.text == "" {
                return "Option 1"
            } else if option3TextField.text == "" {
                return "Question"
            } else {
                return "1"
            }
        }
    }

    // クイズ追加
    @IBAction func create() {
        // 全て埋まっているか確認
        let unFilledForm: String = self.judgeEmpties()

        // 未入力項目があればアラートを出す
        if unFilledForm != "1" {
            let alert = UIAlertController(title: "\(unFilledForm) is empty!", message: "Please fill all of sections", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            
        } else {
            // 現在のクイズ全てを取得
            var quizArray = UserDefaults.standard.array(forKey: "quizArray")!
            
            // 新しいクイズを追加
            quizArray.append([questionTextView.text!, option1TextField.text!, option2TextField.text!, option3TextField.text!, correctAnswer.selectedSegmentIndex + 1])
            
            // UserDefaultsへ保存
            UserDefaults.standard.set(quizArray, forKey: "quizArray")
            
            // アラート
            let alert = UIAlertController(title: "Success!", message: "Your new Quiz was created successfuly.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func dismiss() {
        // 入力済みの項目がある場合に確認アラートを出す
        if self.judgeEmpties() != "0" {
            let alert = UIAlertController(title: "Discard changes?", message: "Quiting this form will discard all changes.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Discard", style: .destructive, handler: { action in
                self.dismiss(animated: true, completion: nil)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }

}
