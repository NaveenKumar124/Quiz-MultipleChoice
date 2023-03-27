//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Navi Malhotra on 2023-03-25.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var firstChoiceButton: UIButton!
    
    @IBOutlet weak var secondChoiceButton: UIButton!
    
    @IBOutlet weak var thirdChoiceButton: UIButton!
    
    //var timer = Timer()
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //questionNumber = 0
        updateLabel()
    }
    
    @objc func updateLabel(){
        
        //let totalQuesLength = quizQuestions.count
        
        //To change to next question
        questionLabel.text = quizBrain.getQuestionText()
        
        //To change Choices
        let answerChoices = quizBrain.getAnswerChoices()
        firstChoiceButton.setTitle(answerChoices[0], for: .normal)
        secondChoiceButton.setTitle(answerChoices[1], for: .normal)
        thirdChoiceButton.setTitle(answerChoices[2], for: .normal)
        
        //To clear buttons on next question
        firstChoiceButton.backgroundColor = UIColor.clear
        secondChoiceButton.backgroundColor = UIColor.clear
        thirdChoiceButton.backgroundColor = UIColor.clear
        
        //To change score after each correct answer
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //To change progress bar
        let percentageProgress = quizBrain.getProgress()
        progressBar.progress = percentageProgress
        
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //Choice 1,2 or 3
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            //print("Right")
            sender.backgroundColor = UIColor.green
        }
        else{
            //print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateLabel), userInfo: nil, repeats: false)
        
        //            updateLabel()
        //viewDidLoad()
        //            questionLabel.text = "Out of questions"
        
    }
}

