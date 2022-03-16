//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var answerTitleLabel: UILabel!
    @IBOutlet var answerDefinitionLabel: UILabel!
    
    var answersChosen: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        answerTitleLabel.text = "Вы - \(getResult().rawValue)!"
        answerDefinitionLabel.text = String(getResult().definition)
    }
    
    private func getResult() -> Animal {
        var countedAnswersOfAnimal: [Animal: Int] = [:]
        var quantityOfTopAnswer: Int
        let defaultAnswerAnimal = answersChosen.first!.animal
        
        for animal in answersChosen {
            countedAnswersOfAnimal[animal.animal, default: 0] += 1
        }
        
        guard let topAnswer = countedAnswersOfAnimal.max(by: { a, b in a.value < b.value }) else {
            return defaultAnswerAnimal
        }
        quantityOfTopAnswer = countedAnswersOfAnimal.values.filter { $0 == topAnswer.value }.count
        
        if topAnswer.value == 1 || quantityOfTopAnswer > 1 { return defaultAnswerAnimal}
        
        return topAnswer.key
    }
}
