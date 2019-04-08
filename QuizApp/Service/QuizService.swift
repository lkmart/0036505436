//
//  GetQuizzes.swift
//  QuizApp
//
//  Created by Luka Martic on 06/04/2019.
//  Copyright © 2019 Luka Martic. All rights reserved.
//

import Foundation
import UIKit

class QuizService {
    
    func getQuizzes(urlString: String, completion: @escaping (([Quiz]?) -> Void)) {
        print("proba1")

        if let url = URL(string: urlString) {
            print("proba2")

            var request = URLRequest(url: url)
            request.addValue("225b3ddf80msha350534f81c8c4cp1c0858jsn2a5d1107aad8", forHTTPHeaderField: "X-RapidAPI-Key")
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                print("proba3")

                var arr: [Quiz] = []
                if let data = data {
                    do {
                        let dataJson = (try JSONSerialization.jsonObject(with: data, options: [])) as! [String:Any]
                        for i in dataJson["quizzes"] as! [Any] {
                            if let quiz = Quiz(json: i) {
                                arr.append(quiz)
                            }
                        }
                        print(arr)
                        completion(arr)
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
        
    }
}
