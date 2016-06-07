//
//  BeginDateTableViewCell.swift
//  VirtualAffairsAssignment
//
//  Created by Said Rehouni on 7/6/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

import UIKit

class BeginDateTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

}
