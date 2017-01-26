//
//  ItemsListTableViewCell.swift
//  TODOListWithSorts
//
//  Created by Vyacheslav Okulov on 1/18/17.
//  Copyright © 2017 Vyacheslav Okulov. All rights reserved.
//

import UIKit

struct ItemsListShowData {
    let title:String
    let date:String
    let colorString:String
}

class ItemsListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configureCell(withItem item:ItemsListShowData) {
        titleLabel.text = item.title
        dateLabel.text = item.date
        contentView.backgroundColor = item.colorString.hexColor
    }
    
}
