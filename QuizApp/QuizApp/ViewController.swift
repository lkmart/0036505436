//
//  ViewController.swift
//  QuizApp
//
//  Created by Luka Martic on 06/04/2019.
//  Copyright © 2019 Luka Martic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var getQuizzesButton: UIButton!
    
    @IBOutlet weak var loadingBar: UIActivityIndicatorView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var questionView: QuestionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadingBar.isHidden = true
        questionView.isHidden = true
        imageView.clipsToBounds = true
        imageView.contentMode = UIView.ContentMode.scaleAspectFill

        
    }

    @IBAction func showQuizzes(_ sender: UIButton) {
        print("vfdvadfvafd")
        sender.isEnabled = false
        funFactLabel.isHidden = true
        errorLabel.isHidden = true
        loadingBar.isHidden = false
        questionView.isHidden = true
        titleLabel.isHidden = true
        questionView.enable()
        questionView.removeColors()
        loadingBar.startAnimating()
        
        let service = QuizService()
        
        service.getQuizzes(urlString: "https://iosquiz.herokuapp.com/api/quizzes"){(quizzes) in
            DispatchQueue.main.async {
                print("usao")
                
                if let quizzesNonNil: [Quiz] = quizzes, quizzesNonNil.count != 0 {
                    print(quizzesNonNil)
                    let n = quizzesNonNil.flatMap({$0.questions}).filter({$0.question.contains("NBA")}).count
                    print(n)
                    self.funFactLabel.text = "Fun fact: \(n) qeustions contain 'NBA'!"
                    
                    let quiz = quizzesNonNil[Int.random(in: 0..<quizzesNonNil.count)]
                    self.questionView.selfInit(question: quiz.questions[Int.random(in: 0..<quiz.questions.count)])
                    
                    sender.tintColor = UIColor.white
                    

                    let imageService = ImageService()
                
                    imageService.fetchFlag(urlString: quiz.imageStringUrl) {(image) in
                        DispatchQueue.main.async {
                            self.titleLabel.text = quiz.title
                            self.titleLabel.backgroundColor = quiz.category.code
                            self.titleLabel.isHidden = false
                            self.imageView.backgroundColor = quiz.category.code
                            self.imageView.image = image
                            self.questionView.isHidden = false
                            self.loadingBar.isHidden = true
                            self.loadingBar.stopAnimating()
                            self.funFactLabel.isHidden = false
                            self.loadingBar.color = UIColor.white
                            
                            sender.isEnabled = true
                        }
                    }
                } else {
                    self.errorLabel.isHidden = false
                }
                
                
            }
        }
        
        

    }
    
    
}

