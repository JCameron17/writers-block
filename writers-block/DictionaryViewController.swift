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

class DictionaryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var wordDatabase = [[String:Any]]()
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "http://api.datamuse.com/words?sp=*&md=d")!

        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
            self.wordDatabase = dataDictionary
            self.tableView.reloadData()
//            print(self.wordDatabase)
           }
        }
        task.resume()
        
        }
    
//    func getAPIData(matching query: String){
//        var components = URLComponents()
//        components.scheme = "http"
//        components.host = "api.datamuse.com"
//        components.path = "/words"
//        components.queryItems = [
//            URLQueryItem(name: "q", value: query),
//            URLQueryItem(name: "def", value: "md=d"),
//            URLQueryItem(name: "pos", value: "md=p"),
//            URLQueryItem(name: "pron", value: "md=r")
//        ]
//
//        let url = components.url
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordDatabase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! DictionaryTableViewCell
        let word = wordDatabase[indexPath.row]
        let wordData = word["word"] as? String
        cell.searchedWordLabel.text = wordData
//        cell.definitionLabel.text = word["defs"] as? String
        return cell
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
