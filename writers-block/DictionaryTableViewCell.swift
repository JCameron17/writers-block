//
//  DictionaryTableViewCell.swift
//  writers-block
//
//  Created by Erinn on 4/13/21.
//

import UIKit

class DictionaryTableViewCell: UITableViewCell {

    @IBOutlet weak var searchedWordLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
