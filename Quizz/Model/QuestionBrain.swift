//
//  QuestionBrain.swift
//  Quizz
//
//  Created by Administrator on 12/06/2023.
//

import Foundation

struct QuestionBrain {

    
    let questions = [
    Question(question: "1 + 1 = 2 có đúng hay không?", result: true),
    Question(question: "1 + 3 = 6 có đúng hay không?", result: false),
    Question(question: "5 * 0 = 0 có đúng hay không?", result: true),
    ]
    
    var currentQuestion = 0
    
    func check(answer: String) -> Bool {
        return questions[currentQuestion].check(strResult: answer)
    }
    
    mutating func nextQuestion() {
        self.currentQuestion = (currentQuestion + 1) % questions.count
    }
    
    func getQuestionText() -> String {
        return questions[currentQuestion].question
    }
    
    func getProgress() -> Float {
        return Float(currentQuestion + 1) / Float(questions.count)
    }
    
    func getScore() -> Int {
        return currentQuestion
    }
}
