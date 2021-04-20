//
//  ThesaurusViewController.swift
//  writers-block
//
//  Created by Jasmine Cameron on 4/18/21.
//

import UIKit

struct APIResponseThes: Codable {
    let wordT: String
    let scoreT: Int
    let defsT: [String]?
}

struct ResultsThes: Codable {
    let wordT: String
    
}

class ThesaurusViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
  
    
    var wordDatabaseThes = [[String:Any]]()
    
    
    @IBOutlet weak var tblaeViewThes: UITableView!
    
    
    @IBOutlet weak var textFieldThes: UITextField!
    
    var searchedWordThes = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldThes.delegate = self
        textFieldThes.becomeFirstResponder()
        tblaeViewThes.dataSource = self
        tblaeViewThes.delegate = self
        
        fetchWordsThes()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField)  -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            searchedWordThes = (textFieldThes.text!).trimmingCharacters(in: .whitespaces)
            fetchWordsThes()
        }
    
    func fetchWordsThes() {
        let url = URL(string: "http://api.datamuse.com/words?max=10&sp=*&md=dpr")!

        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
            self.wordDatabaseThes = dataDictionary
            self.tblaeViewThes.reloadData()
//
           }
        }
        task.resume()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordDatabaseThes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblaeViewThes.dequeueReusableCell(withIdentifier: "thesWordCell", for: indexPath) as! TheaurusTableViewCell
        let word = wordDatabaseThes[indexPath.row]
        let wordData = word["word"] as? String
        cell.searchedWord.text = wordData

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tblaeViewThes.indexPath(for: cell)!
        let word = wordDatabaseThes[indexPath.row]

        let thesaurusDetailsViewController = segue.destination as! ThesaurusDetailsViewController

        thesaurusDetailsViewController.word = word
        
    }
}

    
    
    

    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


