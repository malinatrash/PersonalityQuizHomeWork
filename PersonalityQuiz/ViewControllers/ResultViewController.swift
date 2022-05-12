//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
//MARK: - IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
//MARK: - Public Properties
    var answersArray: [Answer] = []
    
//MARK: - Private Properties
    private var poinsArray = [0, 0, 0, 0]
    
//MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        showResults()
    }
}

//MARK: - Private Methods
extension ResultViewController {
    private func calculatePoints(answers: [Answer]) {
        for answer in answers {
            switch answer.animal {
            case .dog:
                poinsArray[0] += 1
            case .cat:
                poinsArray[1] += 1
            case .rabbit:
                poinsArray[2] += 1
            default:
                poinsArray[3] += 1
            }
        }
    }
    private func showResults() {
        calculatePoints(answers: answersArray)
        let maxPointsAnimal = poinsArray.max()
        if poinsArray[0] == maxPointsAnimal {
            resultLabel.text = "Вы – \(Animal.dog.rawValue)"
            resultDescriptionLabel.text = Animal.dog.definition
            
        } else if poinsArray[1] == maxPointsAnimal {
            resultLabel.text = "Вы – \(Animal.cat.rawValue)"
            resultDescriptionLabel.text = Animal.cat.definition
            
        } else if poinsArray[2] == maxPointsAnimal {
            resultLabel.text = "Вы – \(Animal.rabbit.rawValue)"
            resultDescriptionLabel.text = Animal.rabbit.definition
            
        } else if poinsArray[3] == maxPointsAnimal {
            resultLabel.text = "Вы – \(Animal.turtle.rawValue)"
            resultDescriptionLabel.text = Animal.turtle.definition
        }
    }
}
