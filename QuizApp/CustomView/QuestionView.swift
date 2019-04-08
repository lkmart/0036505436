//
//  QuestionView.swift
//  QuizApp
//
//  Created by Luka Martic on 06/04/2019.
//  Copyright © 2019 Luka Martic. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    @IBOutlet weak var color1: UIImageView!
    @IBOutlet weak var color2: UIImageView!
    @IBOutlet weak var color3: UIImageView!
    @IBOutlet weak var color4: UIImageView!
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var questionTextLabel: UILabel!
    
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2button: UIButton!
    @IBOutlet weak var answer3button: UIButton!
    @IBOutlet weak var answer4button: UIButton!
    
    var correctAnswer: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("QuestionView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    func selfInit(question: Question) {
        questionTextLabel.text = question.question
        answer1Button.setTitle(question.answers[0], for: .normal)
        answer2button.setTitle(question.answers[1], for: .normal)
        answer3button.setTitle(question.answers[2], for: .normal)
        answer4button.setTitle(question.answers[3], for: .normal)

        correctAnswer = question.correctAnswer
    }
    
    @IBAction func pressed1(_ sender: UIButton) {
        if correctAnswer == 0 {
            removeColors()
            disable()
            color1.backgroundColor = UIColor.green
            answer1Button.tintColor = UIColor.black
            
        } else {
            color1.backgroundColor = UIColor.red
            answer1Button.tintColor = UIColor.white
        }
    }
    
    @IBAction func pressed2(_ sender: UIButton) {
        if correctAnswer == 1 {
            removeColors()
            disable()
            color2.backgroundColor = UIColor.green
            answer2button.tintColor = UIColor.black
            
        } else {
            color2.backgroundColor = UIColor.red
            answer2button.tintColor = UIColor.white
        }
    }
    
    @IBAction func pressed3(_ sender: UIButton) {
        if correctAnswer == 2 {
            removeColors()
            disable()
            color3.backgroundColor = UIColor.green
            answer3button.tintColor = UIColor.black
            
        } else {
            color3.backgroundColor = UIColor.red
            answer3button.tintColor = UIColor.white
        }
    }
    
    @IBAction func pressed4(_ sender: UIButton) {
        if correctAnswer == 3 {
            removeColors()
            disable()
            color4.backgroundColor = UIColor.green
            answer4button.tintColor = UIColor.black
            
        } else {
            color4.backgroundColor = UIColor.red
            answer4button.tintColor = UIColor.white
        }
    }
    
    func removeColors() {
        color1.backgroundColor = nil
        color2.backgroundColor = nil
        color3.backgroundColor = nil
        color4.backgroundColor = nil
        answer1Button.tintColor = UIColor.black
        answer2button.tintColor = UIColor.black
        answer3button.tintColor = UIColor.black
        answer4button.tintColor = UIColor.black
    }
    
    func disable() {
        answer1Button.isEnabled = false
        answer2button.isEnabled = false
        answer3button.isEnabled = false
        answer4button.isEnabled = false
    }
    
    func enable() {
        answer1Button.isEnabled = true
        answer2button.isEnabled = true
        answer3button.isEnabled = true
        answer4button.isEnabled = true
    }
    
    
}
