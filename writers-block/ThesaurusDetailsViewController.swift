//
//  ThesaurusDetailsViewController.swift
//  writers-block
//
//  Created by Jasmine Cameron on 4/19/21.
//

import UIKit

class ThesaurusDetailsViewController: UIViewController {

    
    @IBOutlet weak var wordThes: UILabel!
    
    
    var word: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wordThes.text = word["word"] as? String

    }

 


}
