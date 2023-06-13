//
//  ViewController.swift
//  Quizz
//
//  Created by Administrator on 11/06/2023.
//

import UIKit

class ViewController: UIViewController {	
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttonTrue.layer.cornerRadius = 12
        buttonTrue.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        buttonTrue.layer.borderWidth = 3
        buttonFalse.layer.cornerRadius = 12
        buttonFalse.layer.borderWidth = 3
        buttonFalse.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 3)
        updateQuestion()
    }
    
    var timer = Timer()
    var questions = QuestionBrain()

    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var buttonFalse: UIButton!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var buttonTrue: UIButton!
    @IBAction func onAnswerPressed(_ sender: UIButton) {
        if let ans = sender.currentTitle {
            if (questions.check(answer: ans)) {
                questions.nextQuestion()
                sender.backgroundColor = UIColor.green
            } else {
                sender.backgroundColor = UIColor.red
            }
            timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateQuestion() {
        labelQuestion.text = questions.getQuestionText()
        
        buttonTrue.backgroundColor = UIColor.clear
        buttonFalse.backgroundColor = UIColor.clear
        
        progressBar.setProgress(questions.getProgress() , animated: false)
        
        labelScore.text = "Score: \(questions.getScore())"
    }
    
    
}

