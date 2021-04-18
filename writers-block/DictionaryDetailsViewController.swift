//
//  DictionaryDetailsViewController.swift
//  writers-block
//
//  Created by Erinn on 4/15/21.
//

import UIKit

class DictionaryDetailsViewController: UIViewController{
    

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var pronLabel: UILabel!
    
    
    //    var url: String!
    var word: [String: Any]!
//    var tags: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        wordLabel.text = word["word"] as? String
        getDefintions()
        
    }

    
    func getDefintions() {
        let defs = word["defs"]! as! [String]
        let separators = CharacterSet(charactersIn: "\t")
        var parsedSet = [""]
        for item in defs {
            
            let partOfSpeechDef = item.components(separatedBy: separators)[0]
            let def = item.components(separatedBy: separators)[1]
            
            parsedSet.append("\u{2022} (\(partOfSpeechDef)) \(def)")
        }
        
        definitionLabel.text = parsedSet.joined(separator: "\n")
        
    }
    
    
}
