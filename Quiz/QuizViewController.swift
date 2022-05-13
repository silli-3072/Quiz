//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["愛と希望と勇気の日", "１月１４日", "４月２８日", "９月１日", 1])
        quizArray.append(["銀行強盗の日", "２月１３日", "８月３日", "１１月１４日", 1])
        quizArray.append(["恋と革命のインドカリーの日", "４月３０日", "６月１２日", "１２月２３日", 2])
        quizArray.append(["ガッツポーズの日", "４月１１日", "７月７日", "１０月１０日", 1])
        quizArray.append(["スイカの日", "６月４日", "７月２７日", "８月１日", 2])
        quizArray.append(["健康ハートの日", "３月２８日", "８月１０日", "１２月２日", 2])
        quizArray.append(["ニューヨークの日", "１月３日", "６月８日", "９月８日", 3])
        quizArray.append(["さつまいもの日", "２月２８日", "８月８日", "１０月１３日", 3])
        quizArray.append(["フライドチキンの日", "２月９日", "８月２９日", "１１月２１日", 3])
        quizArray.append(["シンデレラデー", "１月３１日", "９月９日", "１２月３１日", 3])
        //------------------------ここから上にクイズを書く------------------------//
        
        quizArray.shuffle()
        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


