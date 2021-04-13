//
//  DictionaryViewController.swift
//  writers-block
//
//  Created by Erinn on 4/8/21.
//

import UIKit

class DictionaryViewController: UIViewController {
    
    
    var wordDatabase = [String:Any]()
    
    
    @IBOutlet weak var searchBar: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello")
        // Do any additional setup after loading the view.
        
        
        let url = URL(string: "http://api.datamuse.com/words?")!
    
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]

              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data
//            self.wordDatabase = dataDictionary["word"] as! [[String:Any]]
            print(dataDictionary)
            
            
            
           }
        }
        task.resume()
        
        }
    
    
//    struct Dictionary {
//        let searchedWord: String
//        let definition: String
//        let partOfSpeech: String
//        let pronunciation: String
//    }



}
