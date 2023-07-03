//
//  GameManager.swift
//  Bullseye
//
//  Created by Behruz Numonov on 23.06.2023.
//

import Foundation

class GameManager {

    // Удайте число
    var guessingNumber: Int
    
    // Текущее очко
    var score: Int
    
    /// Текущий раунд
    var round: Int
    
    /// Максимальное число раундов
    let maxRound: Int = 10
    
    init() {
        self.guessingNumber = Int.random(in: 0...10)
        self.score = 0
        self.round = 1
        func nextRound() {
        }
    }
    
    func nextRound() {
        print("\nНачинаем новый раунд")
        guessingNumber = Int.random(in: 1...10) // каждый раз, рандомно меняем значение для guessingNumber
        round = round + 1 // увеличиваем счетчик раунда
    }
    
    func startNewGame() {
        guessingNumber = Int .random(in: 0...10)
        score = 0
        round = 1
    }
    
    
}

