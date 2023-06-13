//
//  Question.swift
//  Quizz
//
//  Created by Administrator on 12/06/2023.
//

import Foundation

struct Question {
    let question : String
    let result : Bool
    
//    init(question: String, result: Bool) {
//        self.question = question
//        self.result = result
//    }
    
    func check(strResult : String) -> Bool {
        let r = strResult == "True"
        return r == result  
    }
}
