//
//  question.swift
//  Quizzler-iOS13
//
//  Created by Daniil Yarovyi on 4/17/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question
{
    var question: String
    var answer: String
    
    init(q: String, a: String)
    {
        self.question = q
        self.answer = a
    }
}
