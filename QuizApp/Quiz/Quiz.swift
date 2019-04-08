//
//  Quiz.swift
//  QuizApp
//
//  Created by Luka Martic on 06/04/2019.
//  Copyright © 2019 Luka Martic. All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    
    var id: Int
    var title: String
    var description: String
    var category: Category
    var level: Int
    var imageStringUrl: String
    var questions: [Question]
    
    init?(json: Any) {
        
        if let jsonDict = json as? [String: Any?],
            let jsonId = jsonDict["id"] as? Int,
            let jsonTitle = jsonDict["title"] as? String,
            let jsonDescription = jsonDict["description"] as? String,
            let jsonImage = jsonDict["image"] as? String,
            let jsonCategory = Category(category: jsonDict["category"] as! String),
            let jsonLevel = jsonDict["level"] as? Int,
            let jsonQuestions = jsonDict["questions"] as? [Any] {
            
            self.id = jsonId
            self.title = jsonTitle
            self.description = jsonDescription
            self.category = jsonCategory
            self.level = jsonLevel
            self.imageStringUrl = jsonImage
            self.questions = []
            for i in jsonQuestions {
                if let question = Question(json: i) {
                    self.questions.append(question)
                } else {
                    return nil
                }
            }
        } else {
            return nil
        }
    }
}
