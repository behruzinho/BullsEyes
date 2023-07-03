//
//  ViewController.swift
//  Bullseye
//
//  Created by Behruz Numonov on 21.06.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessingLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var hitButton: UIButton!
    
    let gameManager = GameManager()
    
    @IBOutlet weak var rulesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hitButton.backgroundColor = UIColor(named: "Indigo")
        hitButton.layer.borderWidth = 3
        hitButton.layer.borderColor = UIColor.white.cgColor
        hitButton.layer.cornerRadius = 16
        
        // CALayer отвечает за отображение
//        pinkView.layer.cornerRadius = 60 // отвечает за закругления
//        pinkView.layer.borderWidth = 2 // за ширину бордера
//        pinkView.layer.borderColor = UIColor.green.cgColor // цвет бордера
//        pinkView.backgroundColor = .green // цвет background-а
        
        //UIView отвечает за интерактивность
        // Создаем жест, простой тап (клик)
        // #selector(handleTap) - через атрибут #selector вызываем функцию handleTap
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        //  Дальше добавляем жест tapGesture на наш pinkView
//        pinkView.addGestureRecognizer(tapGesture)
        
        // Создаем жест, долгий тап (зажимаем и происходит ивент)
//        // #selector(handleLongPressTap) - через атрибут #selector вызываем функцию handleTap
//        let longPressTap = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressTap))
//        //  Дальше добавляем жест longPressTap на наш pinkView
//        pinkView.addGestureRecognizer(longPressTap)
        
        let thumbImage = UIImage(named: "Nub")
        slider.setThumbImage(thumbImage, for: .normal)
        rulesLabel.text = rulesLabel.text?.uppercased() //lowercased
        print("Угадайте число", gameManager.guessingNumber)
        updateLabels()
    }
    
    // Объявление функции
    @objc func handleTap () {
        print("tapnuli na mena")
    }
    @objc func handleLongPressTap() {
        print("Long press")
    }
    
    @IBAction func handleButtonTap(_ sender: Any) {
        print(slider.value)
        if Int(slider.value) == gameManager.guessingNumber {
            gameManager.score += 100
            print("Вы угадали число!")
        } else {
            print("Вы не угадали число")
        }
        if gameManager.round < 10 {
            gameManager.nextRound()
        } else {
            showGameOverAlert()
        }
        updateLabels()
    }
    
    func updateLabels() {
        guessingLabel.text = String(gameManager.guessingNumber)
        roundLabel.text = String(gameManager.round)
        scoreLabel.text = String(gameManager.score)
    }
    
    //  print("показать алерт и начать новую игру")
    func showGameOverAlert() {
        let myAlert = UIAlertController(title: "Game Over", message: "Вы заработали \(gameManager.score) очков. Начать новую игру?", preferredStyle: .alert)
        
        let handler: ((UIAlertAction)->Void)? = { action in
            print("стартуем новую игру")
            self.gameManager.startNewGame()
            self.updateLabels()
        }
        let action = UIAlertAction(title: "начать", style: .default, handler: handler)
        myAlert.addAction(action)
        show(myAlert, sender: self)
    }
}

