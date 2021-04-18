//
//  DictionaryViewController.swift
//  writers-block
//
//  Created by Erinn on 4/8/21.
//

import UIKit

//struct Endpoint {
//    let path: String
//    let queryItems: [URLQueryItem]
//}
struct APIResponse: Codable {
    let word: String
//    let tags: [String]
    let score: Int
    let defs: [String]?
}

struct Results: Codable {
    let word: String
    
}

class DictionaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating {
    
    var wordDatabase = [[String:Any]]()
    let searchController = UISearchController()
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchWords()
        
        }
    
    func fetchWords() {
        let url = URL(string: "http://api.datamuse.com/words?&sp=*&md=dpr")!

        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print("net request error:", error.localizedDescription)
           } else if let data = data {
            do {let jsonResult = try JSONDecoder().decode([APIResponse].self, from: data)
                print(jsonResult)}
            catch {
                print("api error: " ,error)
            }
//            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
//            self.wordDatabase = dataDictionary
            self.tableView.reloadData()
//            print(self.wordDatabase)
           }
        }
        task.resume()
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! DictionaryTableViewCell
        let word = wordDatabase[indexPath.row]
        let wordData = word["word"] as? String
        cell.searchedWordLabel.text = wordData
//        cell.definitionLabel.text = word["defs"] as? String
//        print(word["defs"])
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let word = wordDatabase[indexPath.row]
        let tags = word["tags"] as? String
        let dictionaryDetailsViewController = segue.destination as! DictionaryDetailsViewController
        
        dictionaryDetailsViewController.tags = tags
        dictionaryDetailsViewController.word = word
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchedWord = searchController.searchBar.text else {
            return
        }
        print(searchedWord)
    }
    
}


//extension Endpoint {
//    static func search(matching query: String) -> Endpoint {
//        return Endpoint (
//        path: "/words",
//        queryItems: [
//            URLQueryItem(name: "q", value: query),
//            URLQueryItem(name: "def", value: "md=d"),
//            URLQueryItem(name: "pos", value: "md=p"),
//            URLQueryItem(name: "pron", value: "md=r")
//        ])
//    }
//}
//
//extension Endpoint {
//    var url: URL? {
//        var components = URLComponents()
//        components.scheme = "http"
//        components.host = "api.datamuse.com"
//        components.path = path
//        components.queryItems = queryItems
//
//        return components.url
//    }
//}
