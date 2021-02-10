//
//  ResultViewController.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/10.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var correctedAnswersLabel: UILabel!
    @IBOutlet var numberOfQuestionsLabel: UILabel!
    
    var correctedAnswers: Int = 0
    var numberOfQuestions: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // 数字反映
        correctedAnswersLabel.text = String(correctedAnswers)
        numberOfQuestionsLabel.text = "/ \(numberOfQuestions)"
    }
    
    @IBAction func backToTitle() {
        // 2画面分戻る
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
