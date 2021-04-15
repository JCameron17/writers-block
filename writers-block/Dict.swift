//
//  Dictionary.swift
//  writers-block
//
//  Created by Erinn on 4/13/21.
//

import Foundation


class Dict {
    static var searchedWord: String?
    static var definition: String?
    var partOfSpeech: String
    var pronunciation: String
    
    init(dict: [String: Any]) {
        Dict.searchedWord = dict["word"] as? String
        Dict.definition = dict["defs"] as? String
        partOfSpeech = dict["tags"] as! String
        pronunciation = dict["pron"] as! String
    }

}
