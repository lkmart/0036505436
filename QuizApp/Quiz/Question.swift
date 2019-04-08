//
//  Question.swift
//  QuizApp
//
//  Created by Luka Martic on 06/04/2019.
//  Copyright © 2019 Luka Martic. All rights reserved.
//

import Foundation

class Question {
    let id: Int
    let question: String
    let answers: [String]
    let correctAnswer: Int
    
    init?(json: Any) {
        if let jsonDict = json as? [String: Any],
            let jsonId = jsonDict["id"] as? Int,
            let jsonQuestion = jsonDict["question"] as? String,
            let jsonAnswers = jsonDict["answers"] as? [String],
            let jsonCorrectAnswer = jsonDict["correct_answer"] as? Int {
            
            self.id = jsonId
            self.question = jsonQuestion
            self.answers = jsonAnswers
            self.correctAnswer = jsonCorrectAnswer
            
        } else {
            return nil
        }
    }
}
