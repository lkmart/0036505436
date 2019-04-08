//
//  Category.swift
//  QuizApp
//
//  Created by Luka Martic on 06/04/2019.
//  Copyright © 2019 Luka Martic. All rights reserved.
//

import Foundation
import UIKit

enum Category {
    
    case SPORTS(UIColor)
    case SCIENCE(UIColor)
    
    init?(category: String){
        switch category {
        case "SPORTS":
            self = .SPORTS(UIColor.orange)
        case "SCIENCE":
            self = .SCIENCE(UIColor.purple)
        default:
            return nil
        }
    }
    
    
    var code: UIColor {
        switch self {
        case .SPORTS( _):
            return UIColor.purple
        case .SCIENCE( _):
            return UIColor.blue
        }
    }
    
}
