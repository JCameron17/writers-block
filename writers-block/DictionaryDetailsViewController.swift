//
//  DictionaryDetailsViewController.swift
//  writers-block
//
//  Created by Erinn on 4/15/21.
//

import UIKit

class DictionaryDetailsViewController: UIViewController {

    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var pronLabel: UILabel!
    
//    var url: String!
    var word: [String: Any]!
    var tags: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let defUrl = URL(string: url + "md=d")
//        let pronUrl = URL(string: url + "md=r")
        let defs = word["defs"]
        
        wordLabel.text = word["word"] as? String
        
//        for item in defs {
//            print(item)
//        }
        print(defs!)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
