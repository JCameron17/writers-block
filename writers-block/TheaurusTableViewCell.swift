//
//  TheaurusTableViewCell.swift
//  writers-block
//
//  Created by Jasmine Cameron on 4/18/21.
//

import UIKit

class TheaurusTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var searchedWord: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
