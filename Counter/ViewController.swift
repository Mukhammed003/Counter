//
//  ViewController.swift
//  Counter
//
//  Created by Muhammed Nurmukhanov on 08.03.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private var counter: Int = 0

    @IBOutlet weak var CounterValueLabel: UILabel!
    
    @IBOutlet weak var IncreaseButton: UIButton!
    
    @IBOutlet weak var DecreseButton: UIButton!
    
    @IBOutlet weak var RefreshButton: UIButton!
    
    @IBOutlet weak var HistoryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CounterValueLabel.text = "Значение счётчика: \(counter)"
        
        HistoryTextView.text = "История изменений: \n"
        
        HistoryTextView.isEditable = false
        HistoryTextView.isScrollEnabled = true
    }
    
    func convertToBeautifulDate() -> String {
        let dateFormatter = DateFormatter()
                
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
                
        let currentDate = Date()
                
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
 
    @IBAction func IncreaseCounterForOne(_ sender: Any) {
        
        counter += 1
        var currentDateTime = convertToBeautifulDate()
        let currentTextOfHistoryTextView = HistoryTextView.text ?? ""
        let newTextForHistoryTextView = "[\(currentDateTime)]: значение изменено на +1"
        
        CounterValueLabel.text = "Значение счётчика: \(counter)"
        
        HistoryTextView.text = currentTextOfHistoryTextView + "\n" + newTextForHistoryTextView
        HistoryTextView.scrollRangeToVisible(NSRange(location: HistoryTextView.text.count - 1, length: 1))
        
        print("Counter increased")
    }
    
    @IBAction func DecreaseCounterForOne(_ sender: Any) {
        
        if(counter > 0){
            counter -= 1
            var currentDateTime = convertToBeautifulDate()
            let currentTextOfHistoryTextView = HistoryTextView.text ?? ""
            let newTextForHistoryTextView = "[\(currentDateTime)]: значение изменено на -1"
            
            CounterValueLabel.text = "Значение счётчика: \(counter)"
            
            HistoryTextView.text = currentTextOfHistoryTextView + "\n" + newTextForHistoryTextView
            HistoryTextView.scrollRangeToVisible(NSRange(location: HistoryTextView.text.count - 1, length: 1))
            
            print("Counter decreased")
        }
        else {
            var currentDateTime = convertToBeautifulDate()
            let currentTextOfHistoryTextView = HistoryTextView.text ?? ""
            let newTextForHistoryTextView = "[\(currentDateTime)]: попытка уменьшить значение счётчика ниже 0"
            
            HistoryTextView.text = currentTextOfHistoryTextView + "\n" + newTextForHistoryTextView
            HistoryTextView.scrollRangeToVisible(NSRange(location: HistoryTextView.text.count - 1, length: 1))
            
            print("Counter is 0")
        }
    }
    @IBAction func RefreshCounterToZero(_ sender: Any) {
        
        counter = 0
        var currentDateTime = convertToBeautifulDate()
        let currentTextOfHistoryTextView = HistoryTextView.text ?? ""
        let newTextForHistoryTextView = "[\(currentDateTime)]: значение сброшено"
        
        CounterValueLabel.text = "Значение счётчика: \(counter)"
        
        HistoryTextView.text = currentTextOfHistoryTextView + "\n" + newTextForHistoryTextView
        HistoryTextView.scrollRangeToVisible(NSRange(location: HistoryTextView.text.count - 1, length: 1))
        
        print("Counter refreshed")
    }
}

